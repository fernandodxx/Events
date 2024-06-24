class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_secure_password
  validates :name, :email, presence: true, uniqueness: true
end
