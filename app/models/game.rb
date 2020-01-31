class Game < ApplicationRecord
  belongs_to :loser, class_name: 'Player', foreign_key: :loser_id
  belongs_to :winner, class_name: 'Player', foreign_key: :winner_id, counter_cache: :score

  validate :players

  private

  def players
    if winner == loser
      errors.add(:loser, 'Winner cannot be loser')
    end
  end
end
