class RankingsController < ApplicationController
  def index
    @ranking = User.ranking
    @users = User.all
  end
end
