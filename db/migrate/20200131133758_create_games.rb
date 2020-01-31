class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :winner, null: false
      t.references :loser, null: false

      t.timestamps
    end
  end
end
