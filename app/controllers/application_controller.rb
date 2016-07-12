class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  
    def not_authenticated
      redirect_to login_path
      flash[:warning] = "Please login first"
    end
end
