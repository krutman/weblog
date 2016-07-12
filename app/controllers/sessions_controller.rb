class SessionsController < ApplicationController
  before_action :require_login, only: :destroy
  before_action :redirect_if_logged_in, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(session_params[:email], session_params[:password])
      redirect_back_or_to posts_path
    else
     flash.now[:danger] = 'Invalid email/password combination'
     render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
  
  private
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
    
    def redirect_if_logged_in
      if logged_in?
        flash[:warning] = "You are already logged in"
        redirect_to posts_path
      end
    end
end
