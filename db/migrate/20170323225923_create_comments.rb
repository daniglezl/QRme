class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :forum_thread, foreign_key: true
      t.integer :parent_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
