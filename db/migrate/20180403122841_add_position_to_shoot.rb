class AddPositionToShoot < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :position, :integer, default: 0
  end
end
