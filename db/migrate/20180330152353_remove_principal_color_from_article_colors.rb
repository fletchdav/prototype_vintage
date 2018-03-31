class RemovePrincipalColorFromArticleColors < ActiveRecord::Migration[5.1]
  def change
    remove_column :article_colors, :is_principal
  end
end
