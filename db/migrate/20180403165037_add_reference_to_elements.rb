class AddReferenceToElements < ActiveRecord::Migration[5.1]
  def change
    add_reference :elements, :activity, foreign_key: true
  end
end
