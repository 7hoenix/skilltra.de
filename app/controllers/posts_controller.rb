class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # before_action :set_sort, only: [:index]

  def index
    @posts = Post.all.order("created_at DESC").paginate(:per_page => 8, :page => params[:page])

  end

  def show
    
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @bids = @post.bids
    end

  # def set_sort
  #   @sort = "All"
  # end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "You can't do that! You need to login first :(" if @post.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :category, :image)
    end
end
