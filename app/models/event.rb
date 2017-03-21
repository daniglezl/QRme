class Event < ApplicationRecord
  belongs_to :user
  has_many :event_instances
  accepts_nested_attributes_for :event_instances

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
