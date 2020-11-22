require 'rails_helper'

RSpec.describe 'CommentsController' do
  before do
    @event = Event.create!(
      name: 'testevent',
      date: Time.zone.today,
      description: 'testmessage',
      email: Faker::Internet.email
    )
  end
  describe 'create' do
    it 'creates a new comment with the right attributes' do
      comment = Comment.create!(
        author: 'testname',
        message: 'testmessage',
        event_id: @event.id
      )

      expect(comment.author).to eq('testname')
      expect(comment.message).to eq(('testmessage'))
      expect(comment.event_id).to eq(@event.id)
    end
  end
end
