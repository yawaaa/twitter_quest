class User < ApplicationRecord


  def self.find_or_create_from_auth(auth)
    user.twitter_ID = auth[:info][:nickname]
    # uid = auth[:uid]
    user.uid = auth[:uid]
  end


end
