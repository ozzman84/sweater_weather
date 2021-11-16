require 'rails_helper'

RSpec.describe EventPoro do
  before :each do
    @event = Event.new({
      id: nil,
      type: "activities",
      attributes: {
        destination: "chicago,il",
        forecast: {
          summary: "overcast clouds",
          temperature: 33.28
        },
        activities: [
          {
            activity: "Learn a new recipe",
            type: "cooking",
            participants: 1,
            price: 0, link: "",
            key: "6553978",
            accessibility: 0.05
          },
          {
            activity: "Start a daily journal",
            type: "relaxation",
            participants: 1,
            price: 0,
            link: "",
            key: "8779876",
            accessibility: 0
           }
         ]
       }
     })
  end

  describe 'instantiation' do
    it 'is an Event with attributes' do
      expect(@event).to be_an(Event)
    end
  end
end
