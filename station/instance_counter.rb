module InstanceCounter
  #self - обращение к самому модулю
  #self.included - определение метода included у этого модуля
  #base - сам класс, куда подключается модуль

  def self.included(base)
    base.extend ClassMethods #метод класса
    base.include InstanceMethods #метод объектов класса
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
