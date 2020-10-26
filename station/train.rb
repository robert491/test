class Train
  attr_reader :id, :type, :cars, :speed, :current_station, :previous_station, :next_station

  def initialize(id, type)
    @id, @type = id, type
    @route, @current_station = nil
    @cars = []
    @speed = 0
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
    if next_station
      @current_station.remove_train(self)
      @current_station = next_station
      @current_station.add_train(self)
    end
  end

  def move_back
    if previous_station
      @current_station.remove_train(self)
      @current_station = previous_station
      @current_station.add_train(self)
    end
  end

  protected # эти методы используются в подклассах

  def same_type?(car)
    self.type == car.type
  end

  def same_car?(car)
    @cars.include?(car)
  end
end
