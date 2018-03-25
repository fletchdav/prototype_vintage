class Shooting < ApplicationRecord
  has_many :shoot_shows, dependent: :destroy
  validates :title, presence: true
end
