class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def to_s(type = '')
    if @trains.empty?
      puts 'Поездов нет.'
    else
      station_trains = []
      @trains.each do |train|
        if [train.type, ''].include?(type)
          station_trains << "ID: #{train.id}\nТип: #{train.type}\nКол-во: #{train.cars.size}" 
        end
      end
      station_trains
    end
  end
end
