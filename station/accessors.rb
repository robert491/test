module Accessors
  def attr_accessor_with_history(*args)
    args.each do |arg|
      arg_var = "@#{arg}"

      arg_history = "#{arg}_history"
      arg_history_var = "@#{arg}_history"

      define_method(arg) { instance_variable_get(arg_var) }
      define_method(arg_history) { instance_variable_get(arg_history_var) }

      define_method("#{arg}=") do |value|
        instance_variable_set(arg_var, value)
        instance_variable_set(arg_history_var, []) if instance_variable_get(arg_history_var).nil?
        instance_variable_get(arg_history_var) << value
      end
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    attr_name_var = "@#{attr_name}"

    define_method(attr_name) { instance_variable_get(attr_name_var) }

    define_method("#{attr_name}=") do |value|
      raise 'Неправильный тип значения.' unless value.is_a?(attr_class)
      instance_variable_set(attr_name_var, value)
    end
  end
end
