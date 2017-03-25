class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread
  has_ancestry

  validates :body, presence: true
end
