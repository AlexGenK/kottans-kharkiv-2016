require './app.rb'

class FiveLittlePigs

  def each
    yield 'Ниф-Ниф'
    yield 'Наф-Наф'
    yield 'Нуф-Нуф'
    yield 'Ноф-Наф'
    yield 'Ниф+Няф'
  end

  include Ebuberable

end

describe Ebuberable do

  it "has realised map method" do
    z=FiveLittlePigs.new.map
    expect(z).to eq ['Ниф-Ниф', 'Наф-Наф', 'Нуф-Нуф', 'Ноф-Наф', 'Ниф+Няф']
  end

  it "has realised map method with block" do
    z=FiveLittlePigs.new.map{|i| "Поросенок #{i}"}
    expect(z).to eq ['Поросенок Ниф-Ниф', 'Поросенок Наф-Наф', 'Поросенок Нуф-Нуф', 'Поросенок Ноф-Наф', 'Поросенок Ниф+Няф']
  end
  
  it "has realised map method with proc" do
    z=FiveLittlePigs.new.map(&:reverse)
    expect(z).to eq ['фиН-фиН', 'фаН-фаН', 'фуН-фуН', 'фаН-фоН', 'фяН+фиН']
  end

  it "has realised select method" do
    z=FiveLittlePigs.new.select{|i| i.include?'Наф'}
    expect(z).to eq ['Наф-Наф', 'Ноф-Наф']
  end

  it "has realised reject method" do
    z=FiveLittlePigs.new.reject{|i| i.include?'Наф'}
    expect(z).to eq ['Ниф-Ниф', 'Нуф-Нуф', 'Ниф+Няф']
  end

  it "has realised grep method" do
    z=FiveLittlePigs.new.grep(/^Наф/)
    expect(z).to eq ['Наф-Наф']
  end

  it "has realised all? method" do
    z=FiveLittlePigs.new.all?
    expect(z).to eq true
  end

  it "has realised all? method with block" do
    z=FiveLittlePigs.new.all?{|i| /-/===i}
    expect(z).to eq false
  end

  it "has realised reduce method with symbol" do
    z=FiveLittlePigs.new.reduce(:+)
    expect(z).to eq 'Ниф-НифНаф-НафНуф-НуфНоф-НафНиф+Няф'
  end

  it "has realised reduce method with initial and symbol" do
    z=FiveLittlePigs.new.reduce('Суммарный поросенок ', :+)
    expect(z).to eq 'Суммарный поросенок Ниф-НифНаф-НафНуф-НуфНоф-НафНиф+Няф'
  end

  it "has realised reduce method with initial and block" do
    z=FiveLittlePigs.new.reduce("Список поросят -") {|accum, item| accum+" "+item}
    expect(z).to eq 'Список поросят - Ниф-Ниф Наф-Наф Нуф-Нуф Ноф-Наф Ниф+Няф'
  end

  it "has realised reduce method with block" do
    z=FiveLittlePigs.new.reduce{|accum, item| accum+" "+item}
    expect(z).to eq 'Ниф-Ниф Наф-Наф Нуф-Нуф Ноф-Наф Ниф+Няф'
  end

end