class SkillsController < ApplicationController
  def index
    @skills = Skill.order("id ASC")
  end
end
