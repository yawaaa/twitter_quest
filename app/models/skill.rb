class Skill < ApplicationRecord
  has_many :skill_learnings
  has_many :users, through: :skill_learnings
  
  
end
