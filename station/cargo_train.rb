require_relative 'train'

class CargoTrain < Train
  def initialize(id, type = :cargo)
    super
  end
end
