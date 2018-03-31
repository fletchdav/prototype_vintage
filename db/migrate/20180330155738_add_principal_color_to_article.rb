class AddPrincipalColorToArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :color, foreign_key: true
  end
end
