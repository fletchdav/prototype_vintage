class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :shows, dependent: :destroy
  has_many :article_colors, dependent: :destroy
  has_many :colors, through: :article_colors
  validates :photo, presence: true

end
