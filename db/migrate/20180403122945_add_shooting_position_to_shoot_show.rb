class AddShootingPositionToShootShow < ActiveRecord::Migration[5.1]
  def change
    add_column :shoot_shows, :shooting_position, :integer, default: 0
  end
end
