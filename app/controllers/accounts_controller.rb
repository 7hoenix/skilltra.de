class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  

  def index
    @accounts = Account.all
   #commeneted out -- didnt need? might break something else
   # @account = Account.find(params[:id])
   # @user = User.find(params[:id])
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)


      if @account.save
        redirect_to @account, notice: 'Account was successfully created.'
      else
        render :new, notice: 'Account was successfully created.'
      end
  end

  def update
    @user = User.find(params[:id])

      if @account.update(account_params)
        @user.account_completed = true
        @user.save

        @account.completed = true
        @account.save
        redirect_to @account, notice: 'Thank you for updating your account. Keep being awesome.'
      else
        render :edit
      end
  end

  def destroy
    @account.destroy
      redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:bio, :primarySkill, :secondarySkill, :company, :completed)
    end

end
