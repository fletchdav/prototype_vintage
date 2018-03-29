class Color < ApplicationRecord
  has_many :article_colors
  has_many :articles, through: :article_colors
end
