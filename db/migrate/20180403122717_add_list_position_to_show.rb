class AddListPositionToShow < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :list_position, :integer, default: 0
  end
end
