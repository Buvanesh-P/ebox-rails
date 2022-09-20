class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]

    def create
        if already_liked?
           @like_instance = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
           @like_instance.destroy
           like_content = ''
            if@post.like.count > 1
                like_content = "#{@post.like.last.userinfo.fullname} and #{(@post.like.count - 1)} other(s) liked"
            elsif@post.like.count == 1
                like_content = "#{@post.like.last.userinfo.fullname} liked"
            end
           render json: {
                status: 'deleted',
                post_id: params[:post_id],
                like_list: like_content
        }
        else
            userInfo = Userinfo.where(users_id: current_user.id)
            userInfoId = userInfo.ids.join(', ')
            @post.like.create(user_id: current_user.id,userinfo_id: userInfoId)
            like_content = ''
            if@post.like.count > 1
                like_content = "You and #{(@post.like.count - 1)} other(s) liked"
            else
                like_content = "You liked"   
            end
            
            render json: {
                status: 'created',
                post_id: params[:post_id],
                like_list: like_content
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
