class Activity < ApplicationRecord
  has_many :elements, dependent: :destroy
  validates :title, presence: true
end
