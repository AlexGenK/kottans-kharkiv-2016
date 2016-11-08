class Position

	def initialize pos
			@positions=pos
	end

  def occupied figure=nil
    figure ? proc {|i| /#{figure}/===@positions[i]} : proc {|i| @positions[i]}
  end

  def to_proc
    proc do |i| 
      [i , @positions[i] ||= :empty]
    end
  end

end