module Api
  module V1
    class YubinController < ApplicationController
      def search
          @yubins = Yubin.where(zipcode: clean_zipcode)
          @message = "該当の郵便番号は見つかりませんでした。" if @yubins.blank?
          @status = @yubins.blank? ? 400 : 200
      end
      private
        def clean_zipcode
          params[:id].to_s.tr('０-９', '0-9').gsub(/[^0-9]/, '')
        end
    end
  end
end
