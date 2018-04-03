class CreateElements < ActiveRecord::Migration[5.1]
  def change
    create_table :elements do |t|
      t.integer :position, default: 0
      t.text :content
      t.string :type
      t.string :photo
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
