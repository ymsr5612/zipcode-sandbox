class Api::V1::YubinController < ApplicationController
  def search
    @yubins = Yubin.where(zipcode: params[:id])
    @message = "該当の郵便番号は見つかりませんでした。" if @yubins.blank?
  end
end
