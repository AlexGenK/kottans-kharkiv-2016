class Position

	@h={}

	def initialize pos
			@h=pos
	end

  def occupied figure=nil
    figure ? proc {|i| @h[i].to_s.include? figure.to_s} : proc {|i| @h[i]}
  end

  def to_proc
    proc do |i| 
      result_array=[]
      result_array << i
      result_array << (@h[i] ? @h[i] : :empty)
    end
  end

end