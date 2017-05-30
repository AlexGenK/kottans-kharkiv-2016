module Ebuberable

  def map(&block)
    out=[]
    block_given? ? each {|item| out << block.call(item)} : out=to_enum(:each)
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
    block ||= :itself.to_proc
    each {|item| return false unless block.call(item)}
    true
  end

  def reduce(*args, &block)
    block=args.pop.to_proc if args.last.is_a? Symbol
    accum=args.shift
    each {|item| accum ? accum=block.call(accum, item) : accum=item}
    accum
  end

end