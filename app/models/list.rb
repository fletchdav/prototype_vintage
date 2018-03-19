class List < ApplicationRecord
  has_many :shows, dependent: :destroy
end
