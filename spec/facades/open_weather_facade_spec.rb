require 'rails_helper'

RSpec.describe 'Open Weather Facade' do
  describe 'receives valid Service Response' do

    xit 'receives valid params' do
      binding.pry
      expect(params[:location]).to eq('denver,co')
    end
  end
end
