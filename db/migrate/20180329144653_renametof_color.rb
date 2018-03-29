class RenametofColor < ActiveRecord::Migration[5.1]
  def change
    rename_column :colors, :t, :l
  end
end
