class BusinessDays

  require "holidays"

  def initialize(start: , region:)
    @business_days=(start..Date::Infinity.new).lazy.select{|day| ((1..5)===day.wday) && (Holidays.on(day, region).empty?)}
  end

  def each
    @business_days.each{|day| yield day}
  end

  include Enumerable

end