class CreateArticleColors < ActiveRecord::Migration[5.1]
  def change
    create_table :article_colors do |t|
      t.references :color, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
