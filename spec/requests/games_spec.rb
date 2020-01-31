require 'rails_helper'

RSpec.describe 'Games API', type: :request do
  let(:player_1) { create :player }
  let(:player_2) { create :player }

  describe 'POST /games' do
    let(:valid_attributes) {
      {
        data: {
          attributes: { 'winner-id': player_1.id, 'loser-id': player_2.id }
        },
        type: 'games'
      }
    }

    context 'when the request is valid' do
      before { post '/games', params: valid_attributes }

      it 'creates a game' do
        expect(JSON.parse(response.body)['data']['attributes']['winner-id']).to eq(player_1.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/games', params: { game: { something: 'Foobar' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
