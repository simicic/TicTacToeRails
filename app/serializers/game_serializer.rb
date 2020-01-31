class GameSerializer < ActiveModel::Serializer
  attributes :winner_id, :loser_id
end
