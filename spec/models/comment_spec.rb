require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @event = Event.create!(
      name: 'testevent',
      date: Time.zone.today,
      description: 'testmessage',
      email: Faker::Internet.email
    )
  end

  subject do
    described_class.new(
      author: 'testname',
      message: 'message',
      event_id: @event.id
    )
  end

  describe 'creation' do
    it 'can be created' do
      expect(subject).to be_valid
    end

    it 'is not valid without an author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a message' do
      subject.message = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an associated event' do
      subject.event_id = nil
      expect(subject).to_not be_valid
    end
  end
end
