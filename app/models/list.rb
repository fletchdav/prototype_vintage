class List < ApplicationRecord
  has_many :shows, dependent: :destroy
  validates :title, presence: true
end
