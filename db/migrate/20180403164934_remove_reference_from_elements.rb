class RemoveReferenceFromElements < ActiveRecord::Migration[5.1]
  def change
    remove_reference :elements, :article, foreign_key: true
  end
end
