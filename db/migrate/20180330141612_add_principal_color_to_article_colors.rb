class AddPrincipalColorToArticleColors < ActiveRecord::Migration[5.1]
  def change
    add_column :article_colors, :is_principal, :boolean, default: false
  end
end
