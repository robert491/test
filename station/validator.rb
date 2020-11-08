module Validator
  protected

  def validate!
    case self.class.to_s
    when 'Station'
      raise 'Нет имени станции.' if @name.length.zero?
    when 'Route'
      raise 'Указана одна и та же станция.' if @first_station == @last_station
    when 'CargoTrain' || 'PassengerTrain'
      raise 'Неправильный формат ID (XXX-XX/XXXXX).' unless @id =~ Train::ID_FORMAT
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
