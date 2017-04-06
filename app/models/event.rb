class Event < ApplicationRecord
  belongs_to :user
  has_many :event_instances, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :invited_users, through: :invitations, source: :user
  has_many :polls, dependent: :destroy
  has_many :forum_threads, dependent: :destroy
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :event_instances
  validates :name, presence: true

  def self.RECURRENT_DAYS
    {
      "No recurrent": 0,
      "Sunday": 1,
      "Monday": 2,
      "Tuesday": 3,
      "Wednesday": 4,
      "Thursday": 5,
      "Friday": 6,
      "Saturday": 7
    }
  end
end
