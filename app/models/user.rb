class User < ApplicationRecord
  has_many :battles                                                               #挑んだバトル
  has_many :challengings, through: :battles, source: :challenge                   #挑んだ人。いらない。
  has_many :reverses_of_battle, class_name: 'Battle', foreign_key: 'challenge_id' #挑まれたバトル
  has_many :fightbacks, through: :reverses_of_battle, source: :user               #挑み返した人。いらない。

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
    user.tp                   = 0
    user.gold                 = 0
     
    # following数 ⇒ Fg 、follower数 ⇒ Fr 、 tweet数 = Twとして。
    # HP  = ( log2(Fg+1)   + log2(Fr+1)   + log2(Tw+1) )^3
    # ATK = ( log2(Fg+1)   + log2(Tw+1)*2              )^3
    # DEF = ( log2(Fr+1)*3                             )^3 
    # 小数はきりすて。
    fg_c = user.followings_count
    fr_c = user.followers_count
    tw_c = user.tweet_count
    user.hp       = ((Math.log(fg_c+1,2) + Math.log(fr_c+1,2) + Math.log(tw_c+1,2) ) ** 3).round
    user.attack   = ((Math.log(fg_c+1,2) + Math.log(tw_c+1,2)*2                    ) ** 3).round
    user.defense  = ((Math.log(fr_c+1,2) *3                                        ) ** 3).round
    end
  end

  def reload
    puts self.hp, self.attack, self.defense
    fg_c = self.followings_count
    fr_c = self.followers_count
    tw_c = self.tweet_count
    self.hp      = ((Math.log(fg_c+1,2) + Math.log(fr_c+1,2) + Math.log(tw_c+1,2) ) ** 3).round
    self.attack  = ((Math.log(fg_c+1,2) + Math.log(tw_c+1,2)*2                    ) ** 3).round
    self.defense = ((Math.log(fr_c+1,2) *3                                        ) ** 3).round
    self.save
  end

  def challenge(other_user)
    unless self == other_user
      winner_id = battles_calc(other_user)
      puts winner_id
   
      self.tp += 10
      self.gold += 30
      self.save
      other_user.tp = 100
      other_user.save
      
   
      
      
      # binding.pry
      self.battles.create(challenge_id: other_user.id, winner: winner_id)
      # binding.pry
    end
  end
  

  def battles_calc(other_user)
      if self.attack > other_user.attack
        winner_id = self.id
      else
        winner_id = other_user.id
      end
      return winner_id
  end
  
  
  
  def self.ranking
    self.group(:user_id).order("user_tp DESC").limit(10)
  end
end
