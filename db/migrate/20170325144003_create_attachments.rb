class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
