class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.uid
    flash[:success] = "twitter認証が完了しました。"
    redirect_to root_path
  end 

  def destroy
  session[:user_id] = nil
  flash[:danger] = "ログアウトしました。"
  redirect_to root_path
  end
end
