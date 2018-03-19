class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.references :list, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
