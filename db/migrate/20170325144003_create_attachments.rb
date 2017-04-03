class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :event, foreign_key: true
      t.string :name, null: false
      t.string :file, null: false
      
      t.timestamps
    end
  end
end
