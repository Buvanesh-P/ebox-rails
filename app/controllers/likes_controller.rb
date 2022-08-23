class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]

    def create
        if already_liked?
           @like_instance = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
           @like_instance.destroy
        else
            @post.like.create(user_id: current_user.id,userinfo_id: current_user.id)
        end
        redirect_to posts_path
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end

end
