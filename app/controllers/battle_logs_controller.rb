class BattleLogsController < ApplicationController
  
  def show
    @user = current_user
    # @battle_logs = @user.battles.order("created_at DESC").page(params[:page])
    @battle_logs = @user.battles.or(@user.reverses_of_battle).order("created_at DESC").page(params[:page])
    # or でActiveRecordのまま結合可能。

  end
  
end
