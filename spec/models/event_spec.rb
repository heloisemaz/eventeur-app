require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(
      name: 'testevent',
      date: Time.zone.today,
      description: 'testmessage',
      email: Faker::Internet.email
    )
  end

  describe 'creation' do
    it 'can be created' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without the email is not a correct email' do
      subject.email = 'test@'
      expect(subject).to_not be_valid
    end
  end
end
