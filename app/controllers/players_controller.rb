class PlayersController < ApplicationController
  def index
    @players = Player.all.select(:id, :name, :score)

    render json: @players
  end
end
