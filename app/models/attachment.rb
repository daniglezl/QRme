class Attachment < ApplicationRecord
  belongs_to      :event
  mount_uploader  :file,  FileUploader # Tells rails to use this uploader for this model.
  #validates       :user,        presence: true # Make sure the user is event admin.
end