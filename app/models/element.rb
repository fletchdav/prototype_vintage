class Element < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :activity
  validates :display, presence: true
end
