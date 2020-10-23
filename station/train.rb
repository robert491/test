class Train
  attr_reader :id, :type, :cars_number, :speed, :current_station, :previous_station, :next_station

  def initialize(id, type, cars_number)
    @id, @type, @cars_number = id, type, cars_number
    @route, @current_station, @previous_station, @next_station = nil
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
    @next_station = @route.stations.fetch(1)
    @current_station.add_train(self)
  end

  def forward
    unless @current_station == @route.last_station
      @current_station.remove_train(self)
      @previous_station, @current_station = @current_station, @next_station
      @next_station = @route.stations.at(@route.stations.index(@current_station) + 1)
      @current_station.add_train(self)
    end
  end

  def back
    unless @current_station == @route.first_station
      @current_station.remove_train(self)
      @next_station, @current_station = @current_station, @previous_station
      @previous_station = @route.stations.at(@route.stations.index(@current_station) - 1)
      @current_station.add_train(self)
    end
  end
end
