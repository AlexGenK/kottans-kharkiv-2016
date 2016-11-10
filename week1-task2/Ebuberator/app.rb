module Ebuberable

  def map(&block)
    out=[]
    block_given? ? each {|item| out << block.call(item)} : each {|item| out << item}
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

  def reduce(*args, &block)
    accum=nil
    block=args.last.to_proc if Symbol===args.last
    accum=args.first unless Symbol===args.first
    each {|item| accum ? accum=block.call(accum, item) : accum=item}
    accum
  end

end