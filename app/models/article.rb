class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :shows, dependent: :destroy
  validates :photo, presence: true

end
