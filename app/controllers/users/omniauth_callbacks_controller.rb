class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
attr_accessor :name

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?

      if @user.balance
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?

      else
      @user.create_account
      @user.balance = 5
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      end

    else

      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to edit_user_registration_url
    end


    def name 
      @name
    end
  end
end 