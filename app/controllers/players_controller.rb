class PlayersController < ApplicationController
  def index
    @players = Player.all

    json_response(@players)
  end

  def create
    @player = Player.create!(player_params)

    json_response(@player)
  end

  def show
    @player = Player.find(params[:id])

    json_response(@player)
  end

  private

  def player_params
    params.permit(:name)
  end
end
