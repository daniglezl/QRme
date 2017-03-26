class PollAnswer < ApplicationRecord
  belongs_to :poll
  validates :title, presence: true
  
  

def default_values
  self.voteCount = 0
end

def name
    "#{title}"
end

end
