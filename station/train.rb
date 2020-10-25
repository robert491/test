class Train
  attr_reader :id, :type, :cars_number, :speed, :current_station, :previous_station, :next_station

  def initialize(id, type, cars_number)
    @id, @type, @cars_number = id, type, cars_number
    @route, @current_station = nil
    @speed = 0
  end

  def speed_up
    @speed += 1
  end

  def stop
    @speed = 0
  end

  def add_car
    @cars_number += 1 if @speed.zero?
  end

  def remove_car
    @cars_number -= 1 if @speed.zero? && @cars_number.positive?
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

  def forward
    if next_station
      @current_station.remove_train(self)
      @current_station = next_station
      @current_station.add_train(self)
    end
  end

  def back
    if previous_station
      @current_station.remove_train(self)
      @current_station = previous_station
      @current_station.add_train(self)
    end
  end
end
