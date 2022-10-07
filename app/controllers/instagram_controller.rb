class InstagramController < ApplicationController
    skip_before_action :authenticate_user!
    def auth 
        auth_code = params[:code]
        rendor json: {"auth_code": auth_code}
    end
    def fbauth
        render json:{"access_token": params[:access_token] }
    end
end
