class CommentsController < ApplicationController
    before_action :set_post
    def create
        @comment = @post.comment.create(comment_params)
        @comment.user = current_user
        @comment.userinfo_id = current_user.id
        # abort @comment.inspect
        if @comment.save
            flash[:notice] = "your comment added"
            redirect_to post_path(@post)
            else
             flash[:alert] = "Something went wrong, please try agin"
             redirect_to post_path(@post)    
        end
    end

    def destroy
        @comment = @post.comment.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end 

    def set_post
        @post = Post.find(params[:post_id]) 
    end
    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
