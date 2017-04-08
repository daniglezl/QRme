class Poll < ApplicationRecord
  belongs_to :event
  has_many :poll_answers, dependent: :destroy
  validates :name, presence: true
end
