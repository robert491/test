require_relative 'car'

class CargoCar < Car
  def initialize(total_capacity = 100)
    super
    @type = :cargo
  end

  def add_cargo
    @current_capacity += 1 if free_space.positive?
  end
end
