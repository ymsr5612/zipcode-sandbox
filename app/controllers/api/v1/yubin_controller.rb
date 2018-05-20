module Api
  module V1
    class YubinController < ApplicationController
      def search
        @yubins = Yubin.where(zipcode: params[:id])
        @message = "該当の郵便番号は見つかりませんでした。" if @yubins.blank?
        @status = @yubins.blank? ? 400 : 200
      end
    end
  end
end
