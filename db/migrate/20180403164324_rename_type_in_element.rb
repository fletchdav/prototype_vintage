class RenameTypeInElement < ActiveRecord::Migration[5.1]
  def change
    rename_column :elements, :type, :display
  end
end
