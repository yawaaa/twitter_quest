class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.uid
    flash[:notice] = "twitter認証が完了しました。"
    redirect_to root_path
  end 

  def destroy
  session[:user_id] = nil
  flash[:notice] = "ログアウトしました。"
  redirect_to root_path
  end
end
