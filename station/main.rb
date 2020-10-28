require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'route'
require_relative 'station'
require_relative 'cargo_car'
require_relative 'passenger_car'
require_relative 'cargo_train'
require_relative 'passenger_train'

class Main
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def create_station(name)
    @stations << Station.new(name)
  end

  def create_train(id, type)
    @trains <<
      case type
      when :cargo
        CargoTrain.new(id)
      when :passenger
        PassengerTrain.new(id)
      end
  end

  def create_route(first_station, last_station)
    @routes << Route.new(first_station, last_station) unless first_station == last_station
  end

  def create_car(train)
    Car.new(@trains[train].type)
  end

  def show_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
  end

  def show_station_info(station)
    puts @stations[station].to_s
  end

  def show_routes
    @routes.each.with_index(1) do |route, index|
      puts "Маршрут № #{index}"
      puts route.to_s
    end
  end

  def show_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. #{train.id} - #{train.type}"
    end
  end

  def add_station_to_route(station, route)
    @routes[route].add_station(@stations[station])
  end

  def remove_station_from_route(station, route)
    @routes[route].remove_station(@stations[station])
  end

  def add_route_to_train(train, route)
    @trains[train].add_route(@routes[route])
  end

  def add_car_to_train(car, train)
    @trains[train].add_car(car)
  end

  def remove_car_from_train(train)
    @trains[train].remove_car(@trains[train].cars.last)
  end

  def move_forward(train)
    @trains[train].move_forward
  end

  def move_back(train)
    @trains[train].move_back
  end

  def user_answer_to_index
    gets.to_i - 1
  end

  def user_agree?(user_choice)
    user_choice == 1 ? true : false
  end
end

main = Main.new

loop do
  puts <<~TEXT
  Введите команду:
  1 Создать станции
  2 Создать поезда
  3 Создать маршруты
  4 Добавить или удалить станцию в существующем маршруте
  5 Назначить маршрут поезду
  6 Добавить или отцепить вагоны поезда
  7 Переместить поезд по маршруту вперед или назад
  8 Просмотреть список станций и поездов на станции
  Нажмите ENTER, чтобы завершить программу.
  TEXT

  user_input = gets.to_i

  case user_input
  when 1
    print 'Название станции: '
    name = gets.chomp

    main.create_station(name)
  when 2
    print 'ID поезда: '
    id = gets.chomp

    print 'Тип поезда (cargo/passenger): '
    type = gets.chomp.to_sym

    main.create_train(id, type)
  when 3
    main.show_stations

    print 'Укажите пункт отправления: '
    station_index = main.user_answer_to_index
    first_station = main.stations[station_index]

    print 'Укажите пункт назначения: '
    station_index = main.user_answer_to_index
    last_station = main.stations[station_index]

    main.create_route(first_station, last_station)
  when 4
    print 'Удалить (0) или добавить (1) станцию в маршруте: '
    user_choice = gets.to_i

    main.show_routes

    print 'Укажите маршрут: '
    route = main.user_answer_to_index

    main.show_stations

    print 'Укажите станцию: '
    station = main.user_answer_to_index

    main.remove_station_from_route(station, route) if !main.user_agree?(user_choice)
    main.add_station_to_route(station, route) if main.user_agree?(user_choice)
  when 5
    main.show_routes

    print 'Укажите маршрут: '
    route = main.user_answer_to_index

    main.show_trains

    print 'Укажите поезд: '
    train = main.user_answer_to_index

    main.add_route_to_train(train, route)
  when 6
    print 'Отцепить (0) или добавить (1) вагоны поезда: '
    user_choice = gets.to_i

    main.show_trains

    print 'Укажите поезд: '
    train = main.user_answer_to_index

    main.remove_car_from_train(train) if !main.user_agree?(user_choice)
    
    car = main.create_car(train)
    main.add_car_to_train(car, train) if main.user_agree?(user_choice)
  when 7
    print 'Переместить поезд по маршруту назад (0) или вперед (1): '
    user_choice = gets.to_i

    main.show_trains

    print 'Укажите поезд: '
    train = main.user_answer_to_index

    main.move_back(train) if !main.user_agree?(user_choice)
    main.move_forward(train) if main.user_agree?(user_choice)
  when 8
    main.show_stations

    print 'Укажите станцию: '
    station = main.user_answer_to_index

    main.show_station_info(station)
  when 0
    break
  end
end
