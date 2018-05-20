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
        create_yubin_date yubins
        ActiveRecord::Base.transaction do
          Yubin.delete_all # ActiveRecordを返さずに削除するので効率がいい。
          Yubin.import yubins
        end
      end
      p "#{Yubin.all.length}件を登録しました。#{time}"
    end

    private

      def create_yubin_date(yubins)
        csv_file_read("public/", "KEN_ALL.CSV").each do |csv|
          add_yubin(yubins, csv)
        end
      end

      def add_yubin(yubins, data)
        yubins <<Yubin.new({
            local_governments_cd: data[0],
            past_zipcode: data[1],
            zipcode: data[2],
            region_kana: data[3],
            locality_kana: data[4],
            street_address_kana: data[5],
            region: data[6],
            locality: data[7],
            street_address: data[8],
            flag_1: data[9],
            flag_2: data[10],
            flag_3: data[11],
            flag_4: data[12],
            view_update: data[13],
            reason: data[14]
          })
      end

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
