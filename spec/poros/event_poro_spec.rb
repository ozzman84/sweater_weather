require 'rails_helper'

RSpec.describe EventPoro do
  before :each do
    @activity1 = {
      activity: "Learn a new recipe",
      type: "cooking",
      participants: 1,
      price: 0, link: "",
      key: "6553978",
      accessibility: 0.05
    }
    @activity2 = {
      activity: "Start a daily journal",
      type: "relaxation",
      participants: 1,
      price: 0,
      link: "",
      key: "8779876",
      accessibility: 0
     }
    @event = EventPoro.new({
      id: nil,
      type: "activities",
      attributes: {
        destination: "chicago,il",
        forecast: { summary: "overcast clouds", temperature: 33.28 },
        activities: [@activity1, @activity2]
       }
     })
  end

  it 'is an Event with attributes' do
    result = %i[destination forecast activities]

    expect(@event).to be_an(EventPoro)
    expect(@event.id).to eq(nil)
    expect(@event.destination).to eq('chicago,il')
    expect(@event.summary).to eq('overcast clouds')
    expect(@event.temperature).to eq(33.28)
  end

  it 'can create ActivityPoros' do
    @event.activities.each do |activity|
      expect(activity).to be_a ActivityPoro
    end
    # expect(@event.gen_activities(@activity2)).to be_a(ActivityPoro)
  end
end
