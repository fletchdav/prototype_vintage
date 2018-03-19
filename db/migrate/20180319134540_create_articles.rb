class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :description
      t.integer :price
      t.text :size

      t.timestamps
    end
  end
end
