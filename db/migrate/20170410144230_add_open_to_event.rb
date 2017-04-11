class AddOpenToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :open, :boolean, default: false
  end
end
