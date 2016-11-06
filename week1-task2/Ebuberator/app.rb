module Ebuberable

  def map(&block)
    out=[]
    each {|item| out << block.call(item)}
    out
  end

  def select(&block)
    out=[]
    each {|item| out << item if block.call(item)}
    out
  end

  def reject(&block)
    out=[]
    each {|item| out << item unless block.call(item)}
    out
  end

  def grep(pattern)
    out=[]
    each {|item| out << item if pattern===item}
    out
  end

  def all?(&block)
    block||=proc{|item| item}
    each {|item| return false unless block.call(item)}
    true
  end

  def reduce(param1=nil, param2=nil, &block)
    if block==nil
      if param2==nil
        sym, accum = param1, param2
      else
        sym, accum = param2, param1
      end
      each {|item| accum ? accum=accum.send(sym, item) : accum=item}
    else
      accum = param1
      each {|item| accum ? accum=block.call(accum, item) : accum=item}
    end
    accum
  end

end