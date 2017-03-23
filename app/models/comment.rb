class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread
  belongs_to :parent, class_name: "Comment", foreign_key: :parent_id
  has_many :subcomments, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
end
