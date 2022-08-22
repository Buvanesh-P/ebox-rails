class PostsController < ApplicationController
  before_action :set_post, :is_registered,only: %i[ show edit update destroy ]
  before_action :is_registered
  # GET /posts or /posts.json
  def index
  #  @posts = Post.all.order("created_at DESC")
  @pagy, @posts = pagy(Post.order(created_at: :desc), items: 1)
  render "scrollable_post" if params[:page]
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, alert: "Post was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def is_registered
    @user_info = Userinfo.find_by(users_id: current_user.id)
    if @user_info.nil?
      redirect_to user_index_path, alert: "Please complete your profile"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :users_id, :content)
    end
    
end
