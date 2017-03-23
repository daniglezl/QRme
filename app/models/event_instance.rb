class EventInstance < ApplicationRecord
  belongs_to :event
  has_many :attendances, dependent: :destroy
end
