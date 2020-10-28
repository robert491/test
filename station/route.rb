class Route
  include InstanceCounter

  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station, @last_station = first_station, last_station
    @stations = [@first_station, @last_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station) unless same_station?(station)
  end

  def remove_station(station)
    @stations.delete(station) if same_station?(station) && !edge_station?(station)
  end

  def to_s
    @stations.map { |station| station.name }
  end

  private # эти методы используются только данным классом
  
  def edge_station?(station)
    [@first_station, @last_station].include?(station)
  end

  def same_station?(station)
    @stations.include?(station)
  end
end
