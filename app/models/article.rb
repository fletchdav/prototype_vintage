class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :shows, dependent: :destroy
  has_many :article_colors, dependent: :destroy
  has_many :colors, through: :article_colors
  validates :photo, presence: true

  after_save :extract_colors


  def article_color
    if self.chosen_color && self.chosen_color != "0" && self.chosen_color != ""
      Color.find(self.chosen_color.to_i).to_hex
    else
      'black'
    end
  end

  def article_color_rgb
    if self.chosen_color && self.chosen_color != "0" && self.chosen_color != ""
      Color.find(self.chosen_color.to_i)
    end
  end

  private

  def extract_colors
  #   photo = Camalian::load(self.photo.url.path) # ne marche pas avec self.photo différent de Article.last.photo
  #   colors = photo.prominent_colors(15).sort_similar_colors
  #   colors.each do |color|
  #     unless c = Color.where(r: color.r, g: color.g, b: color.b).first
  #       c = Color.create(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l)
  #     end
  #     self.colors << c
  #   end
  end


end
