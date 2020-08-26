class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
  
    def take_ride
      if height_check && ticket_check
        start_ride
      elsif height_check && !ticket_check
        "Sorry. " + not_enough_tickets
      elsif !height_check && ticket_check
        "Sorry. " + not_tall_enough
      elsif !height_check && !ticket_check
        "Sorry. " + not_enough_tickets + " " + not_tall_enough
      end
    end
  
    def start_ride
      happiness = self.user.happiness + self.attraction.happiness_rating
      nausea = self.user.nausea + self.attraction.nausea_rating
      tickets = self.user.tickets - self.attraction.tickets
      self.user.update(:happiness => happiness, :nausea => nausea,:tickets => tickets)
      "Thanks for riding the #{self.attraction.name}!"
    end
    
    def height_check
      if self.user.height >= self.attraction.min_height
        true
      else  
        false
      end
    end

    def ticket_check
      if self.user.tickets >= self.attraction.tickets
        true
      else
        false
      end
    end
  
    def not_enough_tickets
      "You do not have enough tickets to ride the #{self.attraction.name}."
    end
  
    def not_tall_enough
      "You are not tall enough to ride the #{self.attraction.name}."
    end
  end
  