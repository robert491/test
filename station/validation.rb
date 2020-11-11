module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(attr, method, param = nil)
      self.validations ||= []
      self.validations << { attr: attr, method: method, param: param }
    end
  end

  module InstanceMethods
    protected

    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get "@#{validation[:attr]}"
        send validation[:method], value, validation[:param]
      end
    end

    def presence(value, param)
      raise 'Нет значения.' if value.empty?
    end

    def format(value, param)
      raise 'Неправильный формат значения.' if value !~ param
    end

    def type(value, param)
      raise 'Аттрибут не соответствует классу.' unless value.is_a?(param)
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
