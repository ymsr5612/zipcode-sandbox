module Api
  module V2
    class YubinController < ApplicationController
      def search
        zipcode = params[:id]
        yubins = Yubin.where(zipcode: trim_hyphen)
        @yubins = YubinService.new(zipcode, yubins).provide
        @message = "該当の郵便番号は見つかりませんでした。" if @yubins.blank?
        @status = @yubins.blank? ? 400 : 200
      end
      private
        def trim_hyphen
          params[:id].delete("-")
        end
    end
  end
end
