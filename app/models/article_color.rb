class ArticleColor < ApplicationRecord
  belongs_to :color
  belongs_to :article
end
