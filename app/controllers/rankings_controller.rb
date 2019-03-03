class RankingsController < ApplicationController
  def index
    @tp_ranking = User.all.order("TP DESC").limit(10)
  end
end
