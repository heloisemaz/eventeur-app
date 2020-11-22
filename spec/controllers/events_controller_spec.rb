require 'rails_helper'

RSpec.describe 'EventsController', type: :controller do
  before do
    @controller = EventsController.new
  end
  describe 'create' do
    it 'creates a new event' do
      expect do
        post :create, params: { event: {
          name: 'testevent',
          date: Time.zone.today,
          description: 'testmessage',
          email: Faker::Internet.email
        } }
      end.to change(Event, :count).by(1)
    end

    it 'creates a new user with the right attributes' do
      event = Event.create!(
        name: 'testevent',
        date: Time.zone.today,
        description: 'testmessage',
        email: Faker::Internet.email
      )

      expect(event.name).to eq('testevent')
      expect(event.date).to eq(Time.zone.today)
      expect(event.description).to eq('testmessage')
    end
  end
end
