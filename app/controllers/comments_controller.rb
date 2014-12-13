class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @blog = Blog.find(params[:blog_id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @blog = Blog.find(params[:blog_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to blog_comments_path
      else
        render :new
      end
  end

  def update
      if @comment.update(comment_params)
        redirect_to @comment, notice: 'Comment was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
      redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :blog_id, :commenter)
    end
end
