class AddAncestryToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :ancestry, :string
    add_index :comments, :ancestry
    remove_index :comments, :parent_id
    remove_column :comments, :parent_id, :integer
  end
end
