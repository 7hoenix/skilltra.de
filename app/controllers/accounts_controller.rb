class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]


#CURRENT: index page displays all accounts. requires user.all
#POSSIBLE:  - more formatting of the page  look nicer - more columns or details may end up being added to the user.


  def index
    @accounts = Account.all.order("created_at DESC").paginate(:per_page => 22, :page => params[:page])
   #commeneted out -- didnt need? might break something else
   # @account = Account.find(params[:id])
   # @user = User.find(params[:id])
    @users = User.all

  end

  def admin_accounts
    @accounts = Account.all
    #commeneted out -- didnt need? might break something else
    # @account = Account.find(params[:id])
    # @user = User.find(params[:id])
    @users = User.all
  end

  #CURRENT: show displays user
  #POSSIBLE: It would be nice if clicking on a user profile displayed information on the jobs that have been complete - change in view
            #may need to add @JOBS where userid = userid to display jobs worked on

  def show
    @user = User.find(params[:id])
    @account = Account.find(params[:id])
  end

  #CURRENT: Currently displays

  def new
  end

  def edit
    @user = User.find(params[:id])
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

  def admin_edit
    @account = Account.all
    @user = User.all
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end


    def account_params
      params.require(:account).permit(:bio, :primarySkill, :secondarySkill, :company, :completed)
    end

end
