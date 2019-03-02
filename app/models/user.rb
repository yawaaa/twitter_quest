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

  def reload
    # following数 ⇒ Fg 、follower数 ⇒ Fr 、 tweet数 = Twと て 
    # HP  = ( log2(Fg+1)   + log2(Fr+1)   + log2(Tw+1) )^3
    # ATK = ( log2(Fg+1)   + log2(Tw+1)*2              )^3
    # DEF = ( log2(Fr+1)*3                             )^3 
    puts self.hp, self.atk, self.def
    
    fg_c = self.followings_count
    fr_c = self.followers_count
    tw_c = self.tweet_count
    
    puts fg_c, fr_c, tw_c
    
    puts Math.log(fg_c+1,2)
    puts (Math.log(fg_c+1,2)).round
    
    self.hp   = ((Math.log(fg_c+1,2) + Math.log(fr_c+1,2) + Math.log(tw_c+1,2) ) ** 3).round
    self.atk  = ((Math.log(fg_c+1,2) + Math.log(tw_c+1,2)*2                    ) ** 3).round
    self.def  = ((Math.log(fr_c+1,2) *3                                        ) ** 3).round
    
    self.save
    
  end

end
