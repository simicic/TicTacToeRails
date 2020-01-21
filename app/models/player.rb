class Player < ApplicationRecord
  validates :name, :score, presence: true
  validates :name, uniqueness: true

  before_save :set_score, if: :new_record?

  private

  def set_score
    self.score = 0
  end
end
