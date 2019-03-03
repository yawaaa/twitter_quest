class SkillLearningsController < ApplicationController
  before_action :require_user_logged_in

  def create
    target_skill = Skill.find(params[:skill_id])
    current_user.learning_skill(target_skill)
    flash.now[:success] = "スキルを習得しました！"
  end



end
