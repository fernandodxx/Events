class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :event_participants
  has_many :attended_events, through: :event_participants, source: :event

  has_secure_password
  validates :name, :email, presence: true, uniqueness: true
end
