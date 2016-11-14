require 'rspec/its'
require 'rspec/collection_matchers'
require './raccoon'

class Raccoon
  
  attr_reader :speed
  attr_reader :state
  attr_accessor :gender

  DIET=['invertebrate', 'plant', 'vertebrate']

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
  end

  # енота можно остановить
  def stop!
    @speed=0
  end

  # здоровый енот девочка будет размножаться со здоровым енотом мальчиком
  def reproduction(pair)
    out=[]
    rand(2..5).times {out << Raccoon.new} if (@gender=='female') && (@state=='healthy') && (pair.gender=='male') && (pair.state=='healthy')
    out
  end

  # если продукт входит в диету енота, то он его помоет, а потом съест. иначе выбросит
  def eat(product)
    DIET.include?(product) ? "#{dousing(product)} and eaten" : "#{product} reject"
  end

  # убить енота!
  def die!
    @speed, @state = 0, 'dead'
    self
  end

  private

  # енот моет
  def dousing(item)
    "#{item} douse"
  end

  # установить скорость енота
  def set_speed(speed, max_speed)
    speed||=rand(1..max_speed)
    @speed=speed
    die! if speed>max_speed
    self
  end

end