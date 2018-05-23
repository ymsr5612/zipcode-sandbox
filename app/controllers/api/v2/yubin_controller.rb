module Api
  module V2
    class YubinController < ApplicationController
      def search
        @yubins = YubinService.new(params[:id]).provide
        @message = "該当の郵便番号は見つかりませんでした。" if @yubins.blank?
        @status = @yubins.blank? ? 400 : 200
      end
    end
  end
end
