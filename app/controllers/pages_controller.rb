class PagesController < ApplicationController
  before_action :on_load, only: [:main]

  def main
  end

  def home
  end

  def about
  end

  def contact
  end

  def profile
  end

  def accounts
  end

  private

  # If users are logged in this reroutes them to posts index.
    def on_load
      if user_signed_in?
        redirect_to posts_path
      end
    end


end
