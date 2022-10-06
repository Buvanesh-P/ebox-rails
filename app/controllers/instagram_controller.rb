class InstagramController < ApplicationController
    def auth 
        auth_code = params[:code]
        rendor json: {"auth_code": auth_code}
    end
end
