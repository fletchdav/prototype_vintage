class AddPositionToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :position, :integer, default: 0
  end
end
