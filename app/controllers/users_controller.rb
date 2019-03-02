class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  end
  
#   def challenge2
#     @user = User.find(params[:id])
#   end
  
#   def user_params
#     params.require(:user).permit(:name,:twitter_ID,          
# :img_url,             
# :description,         
# :listed_count,        
# :tweet_count,        
# :followings_count,    
# :followers_count,    
# :favorites_count,    
# :is_verified,         
# :twitter_created_date)
# end
  
end
