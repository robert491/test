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
      'Поездов нет.'
    else
      @trains.select { |train| [train.type, ''].include?(type) } 
    end
  end
end
