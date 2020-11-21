class Comment < ApplicationRecord
  belongs_to :event

  validates :author, presence: true
  validates :message, presence: true, length: { maximum: 140 }
end
