class BattlesController < ApplicationController
  before_action :require_user_logged_in

  def new
    @users = User.order('updated_at DESC')  #いずれはTPでソートしたい

  end
  
  def create
    user = User.find(params[:challenge_id])
    current_user.challenge(user)
    # binding.pry
    # redirect_to battles_path(current_user.battles.last.id)
    redirect_to battles_result_path
  end
  
  def show
    @user = current_user
    
  end
  
end
