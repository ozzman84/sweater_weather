require 'rails_helper'

RSpec.describe 'API Key' do
  describe 'creation' do
    let(:key) { ApiKey.generator }

    it 'can be created' do
      expect(key).to be_kind_of(String)
    end
  end
end
