class RankingsController < ApplicationController
  def index
    # @ranking = User.ranking
    @users = User.all
    @ranking = User.all.order("TP DESC").limit(10)

  end
end
