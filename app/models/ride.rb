class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates_presence_of :user
  validates_presence_of :attraction

  def take_ride
    @user = User.find(self.user.id)
    current_attraction = self.attraction

    if @user.height < current_attraction.min_height && @user.tickets < current_attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{current_attraction.name}. You are not tall enough to ride the #{current_attraction.name}."
    elsif @user.tickets < current_attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{current_attraction.name}."
    elsif @user.height < current_attraction.min_height
      return "Sorry. You are not tall enough to ride the #{current_attraction.name}."
    end

    updated_user_params = {tickets: @user.tickets - current_attraction.tickets, nausea: @user.nausea + current_attraction.nausea_rating, happiness: @user.happiness + current_attraction.happiness_rating}
    @user.update(updated_user_params)
    "Thanks for riding the #{current_attraction.name}!"
  end


end
