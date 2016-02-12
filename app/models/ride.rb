class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def tickets
    self.attraction.tickets
  end

  def height
    self.attraction.min_height
  end

  def nausea_rating
    self.attraction.nausea_rating
  end

  def happiness
    self.attraction.happiness_rating
  end

  def green_light?
    (user.height >= self.height) && (user.tickets >= self.tickets)
  end

  def too_short?
    (user.height < self.height) && (user.tickets >= self.tickets)
  end

  def no_txts?
    (user.height >= self.height) && (user.tickets < self.tickets)
  end

  def no_txts_and_short?
    (user.height < self.height) && (user.tickets < self.tickets)
  end

  def message
    user = User.find(self.user_id)
    if green_light?
      "Thanks for riding the #{self.attraction.name}!"
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}!"
    elsif no_txts?
      "Sorry. You do not have enough tickets the #{self.attraction.name}!"
    elsif no_txts_and_short?
       "Sorry. You do not have enough tickets the #{self.attraction.name}! You are not tall enough to ride the #{self.attraction.name}!"
    end
  end

  def take_ride
    user = self.user
    if user.tickets > self.tickets
      if self.height < user.height
        user.nausea += self.nausea_rating
        user.happiness += self.happiness
        if self.nausea_rating > 3
          user.happiness = 0
        end
        user.tickets -= self.tickets
      end
    end
    user.save
    self.message
  end

end
