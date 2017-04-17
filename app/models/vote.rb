class Vote < ApplicationRecord
    
    belongs_to :poll
   
   
    def default_values
      self.userId = -1
    end
    
    def default_values
      self.pollAnswerId = -1
    end
  
        
end
