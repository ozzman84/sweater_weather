require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end

  describe 'callbacks' do
    it 'will have an api_key automatically assigned when created' do
      user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user.api_key).to_not be_nil
    end
  end
end
