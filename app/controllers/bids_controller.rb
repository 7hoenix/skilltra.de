class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]



  def index
    @bids = Bid.all
    @posts = Post.all
    @post = Post.find(params[:post_id])
    @bids = @post.bids
    @users =User.all
    @accounts = Account.all
  end

  def show
    @bids = Bid.all
    @posts = Post.all
    @post = Post.find(params[:post_id])
    @bids = @post.bids
    @users =User.all
  end

  def new
    @bid = Bid.new
    @posts = Post.all
    @post = Post.find(params[:post_id])
    @users = User.all
  end

  def edit
   @bid = Bid.new
    @posts = Post.all
    @post = Post.find(params[:post_id])
    @users = User.all


  end

  def create
    @bids = Bid.all
    @bid = Bid.new(bid_params)
    @users = User.all
    @credits =Credit.all

if
       @bid.save
        redirect_to post_bids_path,  notice: 'Bid was successfully created.'
      else
        render :new
      end
  end

  def update
      if @bid.update(bid_params)
        redirect_to @bid, notice: 'Bid was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @bid.destroy
      redirect_to bids_url, notice: 'Bid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:bid, :bidinfo, :post_id, :user_id)
    end
 
end
