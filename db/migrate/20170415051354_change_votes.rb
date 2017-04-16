class ChangeVotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :title, :userId
  end
end
