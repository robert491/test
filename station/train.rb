class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  ID_FORMAT = /^[^\W_]{3}-?[^\W_]{2}$/.freeze

  attr_reader :id, :type, :cars, :speed, :current_station

  validate :id, :presence
  validate :id, :format, ID_FORMAT

  @@trains = {}

  def self.find(id)
    @@trains[id]
  end

  def initialize(id, type)
    @id = id
    @type = type
    validate!
    @cars = []
    @speed = 0
    @@trains[id] = self
    register_instance
  end

  def speed_up
    @speed += 1
  end

  def stop
    @speed = 0
  end

  def add_car(car)
    @cars << car if @speed.zero? && same_type?(car) && !same_car?(car)
  end

  def remove_car(car)
    @cars.delete(car) if @speed.zero? && same_car?(car)
  end

  def add_route(route)
    @route = route
    @current_station = @route.first_station
    @current_station.add_train(self)
  end

  def next_station
    @route.stations[@route.stations.index(@current_station) + 1]
  end

  def previous_station
    @route.stations[@route.stations.index(@current_station) - 1] unless @current_station == @route.first_station
  end

  def move_forward
    return unless next_station

    @current_station.remove_train(self)
    @current_station = next_station
    @current_station.add_train(self)
  end

  def move_back
    return unless previous_station

    @current_station.remove_train(self)
    @current_station = previous_station
    @current_station.add_train(self)
  end

  def each_car(&block)
    @cars.each(&block)
  end

  def to_s
    "ID: #{@id}\nТип: #{@type}\nКол-во: #{@cars.size}"
  end

  protected # эти методы используются в подклассах

  def same_type?(car)
    type == car.type
  end

  def same_car?(car)
    @cars.include?(car)
  end
end
