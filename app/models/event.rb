class Event < ApplicationRecord
  belongs_to :user
  validates :name, :description, :date, presence: true
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 20 }
end
