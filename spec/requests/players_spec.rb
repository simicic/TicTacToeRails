require 'rails_helper'

RSpec.describe 'Player API', type: :request do
  let!(:players) { create_list(:player, 10) }
  let(:player_id) { players.first.id }

  describe 'GET /players' do
    before { get '/players' }

    it 'returns players' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /players/:id' do
    before { get "/players/#{player_id}" }

    context 'when the record exists' do
      it 'returns the player_id' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(player_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:player_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /players' do
    let(:valid_attributes) { { name: 'Elena' } }

    context 'when the request is valid' do
      before { post '/players', params: valid_attributes }

      it 'creates a player' do
        expect(JSON.parse(response.body)['name']).to eq('Elena')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/players', params: { something: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
