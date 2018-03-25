class AddPhotoToShoots < ActiveRecord::Migration[5.1]
  def change
    add_column :shoots, :photo, :string
  end
end
