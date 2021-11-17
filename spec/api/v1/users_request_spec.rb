require 'rails_helper'

describe 'Users' do
  let(:params) {
    {
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  describe 'POST/Register' do
    before { post '/api/v1/users', params: params }
    let(:new_user_id) { User.last.id.to_s }

    it 'authenitcates the User' do
      expect(response).to have_http_status 201
    end

    it 'returns correct format' do
      expect(json).to be_a Hash
      expect(json[:data]).to be_a Hash
      expect(json[:data][:type]).to eq 'users'
      expect(json[:data][:id]).to eq new_user_id
      expect(json[:data][:attributes][:email]).to eq params[:email]
      expect(json[:data][:attributes][:api_key]).to be_a String
    end

    it 'does not return keys' do
      expect(json[:data][:attributes]).to_not have_key :password
      expect(json[:data][:attributes]).to_not have_key :password_confirmation
    end
  end
end
