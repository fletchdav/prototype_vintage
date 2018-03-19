class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :shows
end
