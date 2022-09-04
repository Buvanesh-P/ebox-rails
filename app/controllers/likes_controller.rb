class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]

    def create
        if already_liked?
           @like_instance = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
           @like_instance.destroy
           render json: {
                status: 'deleted',
                post_id: params[:post_id]
        }
        else
            @post.like.create(user_id: current_user.id,userinfo_id: current_user.id)
            render json: {
                status: 'created',
                post_id: params[:post_id]
        }
        end
                
    end

    def index
        @like = Like.where(post_id: params[:post_id])
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end

end
