class ChangeOlorInArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :chosen_olor, :chosen_color
  end
end
