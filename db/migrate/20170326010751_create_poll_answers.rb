class CreatePollAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_answers do |t|
      t.references :poll, foreign_key: true
      t.string :title
      t.integer :voteCount

      t.timestamps
    end
  end
end
