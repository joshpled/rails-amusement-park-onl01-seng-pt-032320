class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides

    def mood
        
        if self.admin == false
            if self.happiness > self.nausea
                self.mood = "happy"
            else
                self.mood = "sad"
            end
        end 
    end
end
