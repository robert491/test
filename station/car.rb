require_relative 'manufacturer'

class Car
  include Manufacturer

  attr_reader :type, :total_capacity, :current_capacity

  def initialize(total_capacity = 100)
    @total_capacity = total_capacity
    @current_capacity = 0
  end

  protected

  def free_space
    @total_capacity - @current_capacity
  end
end
