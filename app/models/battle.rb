class Battle < ApplicationRecord
  belongs_to :user
  belongs_to :challenge, class_name: 'User'
end
