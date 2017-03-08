class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by_auth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Logged in as #{user.name}"
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_url, :notice => "Logged out!"
  end

  private
  
  def auth_hash
    request.env['omniauth.auth']
  end
end