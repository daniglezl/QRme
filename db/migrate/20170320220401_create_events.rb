class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.integer :recurrent, default: 0

      t.timestamps
    end
  end
end
