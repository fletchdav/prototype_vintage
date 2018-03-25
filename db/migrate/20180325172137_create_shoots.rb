class CreateShoots < ActiveRecord::Migration[5.1]
  def change
    create_table :shoots do |t|
      t.text :description
      t.timestamps
    end
  end
end
