class Event < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 60 }
  validates :date, presence: true
  validates :description, length: { maximum: 300 }
  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
