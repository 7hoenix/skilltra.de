class BetasController < ApplicationController
  before_action :authenticate_user!

def new
 @beta = Beta.new
end

def create
  @beta = Beta.new(beta_params)
  if @beta.save
    redirect_to pages_main_path, notice: 'Thank you for signing up for the beta! You will hear from us soon.'
  end
end

private

def beta_params
  params.require(:beta).permit(:email, :skill)
end

end
