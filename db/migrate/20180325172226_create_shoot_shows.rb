class CreateShootShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shoot_shows do |t|
      t.references :shoot, foreign_key: true
      t.references :shooting, foreign_key: true
      t.timestamps
    end
  end
end
