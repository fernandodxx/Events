class Event < ApplicationRecord
  belongs_to :user
  has_many :event_participants
  has_many :participants, through: :event_participants, source: :user
  
  validates :name, :description, :date, presence: true
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 20 }

  scope :past, -> { where('date < ?', Date.today) }
  scope :future, -> { where('date > ?', Date.today)}

  def past?
    date < Date.today
  end

  def future?
    date >= Date.today
  end
end
