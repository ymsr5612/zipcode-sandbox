module Api
  module V1
    class YubinController < ApplicationController
    def search
        @yubins = Yubin.where(zipcode: trim_hyphen)
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
