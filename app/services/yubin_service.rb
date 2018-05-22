class YubinService < BaseService
  attr_reader :zipcode,
              :yubins

def initialize(zipcode, yubins)
  @zipcode = zipcode
  @yubins = yubins
end

private
  def perform
    street_address = ""
    @yubins.each do |y|
      street_address += y.street_address
    end
    yubin = {
      :zipcode => @zipcode,
      :region => yubins.first.region,
      :locality => yubins.first.locality,
      :street_address => street_address
    }
    [yubin]
  end
end
