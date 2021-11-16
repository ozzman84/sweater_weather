require 'rails_helper'

RSpec.describe ActivityPoro do
  before :each do
    @activity1 = ActivityPoro.new({
      activity: "Learn a new recipe",
      type: "cooking",
      participants: 1,
      price: 0, link: "",
      key: "6553978",
      accessibility: 0.05
    })
  end

  it 'is an Activity with attributes' do
    expect(@activity1).to be_a(ActivityPoro)
    expect(@activity1.title).to eq('Learn a new recipe')
    expect(@activity1.type).to eq('cooking')
    expect(@activity1.participants).to eq(1)
    expect(@activity1.price).to eq(0)
  end
end
