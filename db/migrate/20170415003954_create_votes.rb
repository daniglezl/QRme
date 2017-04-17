class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :poll, foreign_key: true
      t.integer :title
      t.integer :voteCount
      t.timestamps
    end
  end
end
