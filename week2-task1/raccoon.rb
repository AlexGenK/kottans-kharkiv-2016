require 'rspec/its'
require 'rspec/collection_matchers'
require './raccoon'

class Raccoon
  
  attr_reader :speed
  attr_reader :state
  attr_accessor :gender

  DIET=['invertebrate', 'plant', 'vertebrate']
<<<<<<< HEAD
  MAX_RUN_SPEED=24
  MAX_SWIM_SPEED=4

  # изначально енот здоров и недвижим
  def initialize(gender=nil, state: nil)
    @speed=0
    state||=:healthy
    gender||=rand(0..1)==0 ? :male : :female
    @state=state
    @gender=gender
  end

  # енот может бежать с некоторой скоростью, но не больше маскимальной
  def run!(speed=nil)
    set_speed(speed, MAX_RUN_SPEED)
  end

  # енот может плыть с некоторой скоростью, но не больше маскимальной
  def swim!(speed=nil)
    set_speed(speed, MAX_SWIM_SPEED)
=======

  # изначально енот здоров и недвижим
  def initialize(gender=nil)
    @speed=0
    @state='healthy'
    gender||=rand(0..1)==0 ? 'male': 'female'
    @gender=gender
  end

  # енот может бежать с некоторой скоростью, но если заставить его бежать быстрее максмальной скорости, то енот дохнет
  def run!(speed=nil)
    set_speed(speed, 24)
  end

  # енот может плыть с некоторой скоростью, но если заставить его плыть быстрее максмальной скорости, то енот дохнет
  def swim!(speed=nil)
    set_speed(speed, 4)
>>>>>>> origin/raccoon
  end

  # енота можно остановить
  def stop!
    @speed=0
  end

  # здоровый енот девочка будет размножаться со здоровым енотом мальчиком
  def reproduction(pair)
    out=[]
<<<<<<< HEAD
    rand(2..5).times {out << Raccoon.new} if (@gender==:female) && (@state==:healthy) && (pair.gender==:male) && (pair.state==:healthy)
=======
    rand(2..5).times {out << Raccoon.new} if (@gender=='female') && (@state=='healthy') && (pair.gender=='male') && (pair.state=='healthy')
>>>>>>> origin/raccoon
    out
  end

  # если продукт входит в диету енота, то он его помоет, а потом съест. иначе выбросит
  def eat(product)
<<<<<<< HEAD
    DIET.include?(product) ? "#{dousing(product)} and eaten" : raise(ArgumentError, "Not eating")
=======
    DIET.include?(product) ? "#{dousing(product)} and eaten" : "#{product} reject"
>>>>>>> origin/raccoon
  end

  # убить енота!
  def die!
<<<<<<< HEAD
    @speed, @state = 0, :dead
    self
  end

  def dead?
    @state==:dead && @speed==0
  end

=======
    @speed, @state = 0, 'dead'
    self
  end

>>>>>>> origin/raccoon
  private

  # енот моет
  def dousing(item)
    "#{item} douse"
  end

  # установить скорость енота
  def set_speed(speed, max_speed)
    speed||=rand(1..max_speed)
<<<<<<< HEAD
    raise(ArgumentError, "Too fast") if speed>max_speed
    @speed=speed
=======
    @speed=speed
    die! if speed>max_speed
>>>>>>> origin/raccoon
    self
  end

end