class GamesController < ApplicationController
  def create
    @game = Game.create!(game_params)

    render json: @game
  end

  private

  def game_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(
      params,
      only: [:'winner-id', :'loser-id']
    )
  end
end
