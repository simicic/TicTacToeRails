class Player < ApplicationRecord
  validates :name, :score, presence: true
  validates :name, uniqueness: true
end
