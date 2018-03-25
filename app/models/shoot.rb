class Shoot < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :shoot_shows, dependent: :destroy
  validates :photo, presence: true
end
