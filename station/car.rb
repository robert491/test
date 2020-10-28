require_relative 'manufacturer'

class Car
  include Manufacturer

  attr_reader :type

  def initialize(type)
    @type = type
  end
end
