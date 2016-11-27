class Object

  def try(*a, &block)
    method=a.shift
    if method
      (self && respond_to?(method)) ? send(method, *a, &block) : nil
    else
      self ? block.call(self) : nil
    end
  end
  
end