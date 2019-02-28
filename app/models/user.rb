class User < ApplicationRecord

  def self.find_or_create_from_auth(auth)
    uid = auth[:uid]

    self.find_or_create_by(uid: uid) do |user| 
    #初回のみ
    user.twitter_ID           = auth[:info][:nickname]
    user.name                 = auth[:info][:name]
    user.img_url              = auth[:extra][:raw_info][:profile_image_url].gsub("_normal.","_400x400.")
    user.description          = auth[:info][:description]
    user.listed_count         = auth[:extra][:raw_info][:listed_count]
    user.tweet_count          = auth[:extra][:raw_info][:statuses_count]
    user.followings_count     = auth[:extra][:raw_info][:friends_count]
    user.followers_count      = auth[:extra][:raw_info][:followers_count]
    user.favorites_count      = auth[:extra][:raw_info][:favourites_count]
    user.is_verified          = auth[:extra][:raw_info][:verified]
    user.twitter_created_date = auth[:extra][:raw_info][:created_at]
     
    end
  end


end
