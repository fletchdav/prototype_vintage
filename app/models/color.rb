class Color < ApplicationRecord
  has_many :article_colors
  has_many :articles, through: :article_colors

  def to_hex
    Camalian::Color.new(self.r, self.g, self.b).to_hex
  end

end
