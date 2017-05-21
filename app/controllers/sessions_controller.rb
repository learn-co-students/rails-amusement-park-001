class SessionsController < ApplicationController

  def main_page
  end

  def signin
  end

  def create
    @user = User.find_by(name: session_params[:name])

    if @user && @user.authenticate(session_params[:password]) == @user
      session[:user_id] = @user.id
      redirect_to @user and return
    else
      redirect_to '/' and return
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end

end