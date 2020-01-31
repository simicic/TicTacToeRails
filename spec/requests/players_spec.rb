require 'rails_helper'

RSpec.describe 'Player API', type: :request do
  let!(:players) { create_list(:player, 10) }
  let(:player_id) { players.first.id }

  describe 'GET /players' do
    before { get '/players' }

    it 'returns players' do
      expect(JSON.parse(response.body)['data']).not_to be_empty
      expect(JSON.parse(response.body)['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
