require 'rails_helper'

describe 'Sessions Requests' do
  describe 'Post Session' do
    describe 'Valid User' do
      let(:user_params) {
        {
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
      let!(:user) { User.create!(user_params) }

      context 'Valid params' do
        let(:valid_params) { {
            email: 'test@test.com',
            password: 'password'
          }
        }
        before { post '/api/v1/sessions', params: valid_params }

        it 'response is successful' do
          expect(response).to be_successful
        end

        it 'returns correct format' do
          expect(json).to be_a Hash
          expect(json[:data]).to be_a Hash
          expect(json[:data][:type]).to eq 'users'
          expect(json[:data][:id]).to eq user.id.to_s
          expect(json[:data][:attributes][:email]).to eq valid_params[:email]
          expect(json[:data][:attributes][:api_key]).to be_a String
        end

        it 'does not return keys' do
          expect(json[:data][:attributes]).to_not have_key :password
          expect(json[:data][:attributes]).to_not have_key :password_confirmation
        end
      end

      context 'Invalid params' do
        let(:valid_params) { {
            email: 'test@test.com',
            password: 'passwor'
          }
        }
        before { post '/api/v1/sessions', params: valid_params }

        it 'response is unsuccessful' do
          expect(response).to have_http_status 400
        end
      end
    end
  end
end
