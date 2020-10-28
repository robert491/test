class Station
  include InstanceCounter

  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def to_s(type = '')
    if @trains.empty?
      'Поездов нет.'
    else
      @trains.select { |train| [train.type, ''].include?(type) } 
    end
  end
end
