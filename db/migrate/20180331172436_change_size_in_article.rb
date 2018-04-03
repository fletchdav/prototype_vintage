class ChangeSizeInArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :size, :chosen_olor
  end
end
