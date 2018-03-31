class RemoveReferenceFromArticle < ActiveRecord::Migration[5.1]
  def change
    remove_reference :articles, :color, foreign_key: true
  end
end
