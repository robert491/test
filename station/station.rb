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

  def to_s(type = "all")
    @trains.each do |train|
      if [type, "all"].include?(train.type)
        puts <<~TEXT
        ============
        ID:#{train.id}
        Тип:#{train.type}
        Кол-во:#{train.cars_number}"
        TEXT
      end
    end
  end
end
