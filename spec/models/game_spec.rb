require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:winner) }
  it { should belong_to(:loser) }

  describe '#validate_associations' do
    let(:winner) { create :player }

    context 'when the record is valid' do
      let(:loser) { create :player }
      let(:game) { build :game, winner_id: winner.id, loser_id: loser.id }

      it 'stores the record' do
        expect { game.save }.to change { Game.count }.from(0).to(1)
      end
    end

    context 'when winner and loser are the same' do
      let(:game) { build :game, winner_id: winner.id, loser_id: winner.id }

      it 'does not store the record' do
        expect { game.save }.not_to change { Game.count }
      end
    end
  end
end
