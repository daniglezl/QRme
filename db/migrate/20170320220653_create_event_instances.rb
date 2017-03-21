class CreateEventInstances < ActiveRecord::Migration[5.0]
  def change
    create_table :event_instances do |t|
      t.references :event, foreign_key: true
      t.datetime :date, null: false
      t.text :location, null: false

      t.timestamps
    end
  end
end
