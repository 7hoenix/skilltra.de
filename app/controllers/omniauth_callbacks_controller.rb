class OmniauthCallbacksController < Devise::OmniauthCallbacksController




  def linkedin
    ###connect to linkedin ominauth -begin login
      auth = env["omniauth.auth"]
      @user = User.connect_to_linkedin(request.env["omniauth.auth"], current_user)
      @reviewed_user = session[:reviewed_user]
##
      if @user.persisted?

        if @user.balance
                sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
                set_flash_message(:notice, :success, :kind => "linkedin") if is_navigational_format?
        else
          @user.account_completed = false
          @user.balance = 3
          @user.jobs_completed = 0
          @user.average_score = 0
          @user.open_jobs = 0

          @user.verified = 1

          sign_in @user, :event => :authentication

            if session[:reviewed_user] != nil
              redirect_to new_user_survey_path(@reviewed_user) #this will throw if @user is not activated
              set_flash_message(:notice, :success, :kind => "linkedin") if is_navigational_format?
            else
              sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
              set_flash_message(:notice, :success, :kind => "linkedin") if is_navigational_format?
            end
          end

      else
        session["devise.linkedin_uid"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

end
