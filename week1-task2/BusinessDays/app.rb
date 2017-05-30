class BusinessDays

  require "holidays"

  def initialize(start: , region:)
    @business_days=(start..Date::Infinity.new).lazy.select{|day| ((1..5)===day.wday) && (Holidays.on(day, region).empty?)}
  end

  def each(&block)
    @business_days.each(&block)
  end

  include Enumerable

end