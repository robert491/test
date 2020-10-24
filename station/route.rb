class Route
  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station, @last_station = first_station, last_station
    @stations = [@first_station, @last_station]
  end

  def add_station(station)
    @stations.insert(-2, station) unless edge_station?(station)
  end

  def remove_station(station)
    @stations.delete(station) unless edge_station?(station)
  end

  def edge_station?(station)
    [@first_station, @last_station].include?(station)
  end

  def to_s
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}" }
  end
end
