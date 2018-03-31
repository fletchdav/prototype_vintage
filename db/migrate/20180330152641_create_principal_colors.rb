class CreatePrincipalColors < ActiveRecord::Migration[5.1]
  def change
    create_table :principal_colors do |t|
      t.integer :r
      t.integer :g
      t.integer :b

      t.timestamps
    end
  end
end
