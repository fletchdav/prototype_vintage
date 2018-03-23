class AddIsSpecialToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :is_special, :boolean, default: false
  end
end
