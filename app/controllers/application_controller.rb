class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :authenticate

  def index
  end
  
  

  # before_action :set_twitter_client

  # def update
  #   @twitter.update("テスト")
  #   render plain: "Twitter.update"
  # end

  # private

  # def set_twitter_client
  #   @twitter = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = "YOUR_CONSUMER_KEY"
  #     config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  #     config.access_token        = "YOUR_ACCESS_TOKEN"
  #     config.access_token_secret = "YOUR_ACCESS_SECRET"
  #   end
  
  private
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
  
  
end
