class YubinService < BaseService
  attr_reader :zipcode,
              :yubins

  def initialize(zipcode)
    @zipcode = zipcode.to_s.tr('０-９', '0-9').sub(/[^0-9]/, '')
    @yubins = Yubin.where(zipcode: @zipcode).order('street_address ASC')
  end

  private
    def perform
      @yubins.each do |yubin|
        yubin.street_address.sub!(/～.+$|（.+$|、.+$|以下に記載がない場合|^[0-9０-９].+$/,'')
      end
      @yubins
    end
end
