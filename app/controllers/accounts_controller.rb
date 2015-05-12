class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :start_over]
  before_action :authenticate_user!

#CURRENT: index page displays all accounts. requires user.all
#POSSIBLE:  - more formatting of the page  look nicer - more columns or details may end up being added to the user.


  def start_over
    @account.verified = 1
    @account.save
  end

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
    @account = Account.find(params[:id])
    @user = User.find(@account.user_id)
  end

  #CURRENT: Currently displays

  def new
    @account.verified = 1
  end

  def edit

    @user = User.find(params[:id])
    @skills = Skill.all
  end

  def create
    binding.pry
    @account = Account.new(account_params)

      if @account.save
        redirect_to @account, notice: 'Account was successfully created.'
      else
        render :new, notice: 'Account was successfully created.'
      end
  end

  def update
    @user = User.find(params[:id])
    @testimonial = User.find(params[:id])

      if @account.update(account_params)
        @user.account_completed = true
        @user.save

        @account.completed = true
        @account.save


        if @account.verified <= 6
          @account.verified += 1
          @account.save
          redirect_to edit_account_path(@account)
        else
          redirect_to @account, notice: 'Thank you for updating your account. Keep being awesome.'
        end
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
      params.require(:account).permit(:bio, :primarySkill, :secondarySkill, :company, :completed, :avatar, :need1, :need2, :need3, :trade1, :trade2, :trade3, :skill_set, :months_of_experience, :projects_completed)
    end

end