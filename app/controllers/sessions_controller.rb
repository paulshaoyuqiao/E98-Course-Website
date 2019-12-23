class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to :controller => 'course', :action => 'score'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
