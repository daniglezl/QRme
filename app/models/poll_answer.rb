class PollAnswer < ApplicationRecord
  belongs_to :poll
  validates :title, presence: true
  
  after_initialize :default_values

def default_values
  self.voteCount = 0
end

end
