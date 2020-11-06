require_relative 'car'

class PassengerCar < Car
  def initialize(total_capacity = 100)
    super
    @type = :passenger
  end

  def add_passenger
    @current_capacity += 1 if free_space.positive?
  end
end
