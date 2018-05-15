require 'open-uri'
require 'zip'
require 'csv'

class Tasks::JapanPost
  class << self
    def download_zipcodes_file
      delete_files(['public/KEN_ALL.CSV', 'public/ken_all.zip'])
      download_and_save("public/", "http://www.post.japanpost.jp/zipcode/dl/oogaki/zip/ken_all.zip")
      unzip_file("public/", "ken_all.zip")
      p 'public/ken_all.zipファイルの展開に成功しました。'
    end

    def update_zipcodes
      yubins = []
      time = Benchmark.realtime do
        csv_file_read("public/", "KEN_ALL.CSV").each do |csv|
          yubins << Yubin.new({
              local_governments_cd: csv[0],
              past_zipcode: csv[1],
              zipcode: csv[2],
              region_kana: csv[3],
              locality_kana: csv[4],
              street_address_kana: csv[5],
              region: csv[6],
              locality: csv[7],
              street_address: csv[8],
              flag_1: csv[9],
              flag_2: csv[10],
              flag_3: csv[11],
              flag_4: csv[12],
              view_update: csv[13],
              reason: csv[14]
            })
        end
        Yubin.import yubins
      end
      p "#{Yubin.all.length}を登録しました。#{time}"
    end

    private

      def delete_files(delete_files)
        delete_files.each do |file|
          File.delete file
        end
      end

      def download_and_save(dir_path, url_path)
        fileName = File.basename url_path
        open(dir_path + "#{fileName}", 'wb') do |output|
          open(url_path) do |data|
            output.write(data.read)
          end
        end
      end

      def unzip_file(dir_path, file_name)
        Zip::File.open(dir_path + file_name) do |zip|
          zip.each do |entry|
            # { true } は展開先に同名ファイルが存在する場合に上書きする指定
            zip.extract(entry, dir_path + entry.name) { true }
          end
        end
      end

      def csv_file_read(dir_path, file_name)
        CSV.read(dir_path + file_name, encoding: "CP932:UTF-8");
      end
  end
end
