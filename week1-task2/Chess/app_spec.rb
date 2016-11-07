require './app.rb'

describe Position  do

  CHESSBOARD = (:a1..:h8)
  
  it "can mapping positions of figures on the chessboard" do
    pos=Position.new(a1: :black_queen, e2: :white_queen, h5: :white_bishop)

    result_hash={:a1=>:black_queen, :a2=>:empty, :a3=>:empty, :a4=>:empty, :a5=>:empty, :a6=>:empty, :a7=>:empty, :a8=>:empty, :a9=>:empty, 
    :b0=>:empty, :b1=>:empty, :b2=>:empty, :b3=>:empty, :b4=>:empty, :b5=>:empty, :b6=>:empty, :b7=>:empty, :b8=>:empty, :b9=>:empty, 
    :c0=>:empty, :c1=>:empty, :c2=>:empty, :c3=>:empty, :c4=>:empty, :c5=>:empty, :c6=>:empty, :c7=>:empty, :c8=>:empty, :c9=>:empty, 
    :d0=>:empty, :d1=>:empty, :d2=>:empty, :d3=>:empty, :d4=>:empty, :d5=>:empty, :d6=>:empty, :d7=>:empty, :d8=>:empty, :d9=>:empty, 
    :e0=>:empty, :e1=>:empty, :e2=>:white_queen, :e3=>:empty, :e4=>:empty, :e5=>:empty, :e6=>:empty, :e7=>:empty, :e8=>:empty, :e9=>:empty, 
    :f0=>:empty, :f1=>:empty, :f2=>:empty, :f3=>:empty, :f4=>:empty, :f5=>:empty, :f6=>:empty, :f7=>:empty, :f8=>:empty, :f9=>:empty, 
    :g0=>:empty, :g1=>:empty, :g2=>:empty, :g3=>:empty, :g4=>:empty, :g5=>:empty, :g6=>:empty, :g7=>:empty, :g8=>:empty, :g9=>:empty, 
    :h0=>:empty, :h1=>:empty, :h2=>:empty, :h3=>:empty, :h4=>:empty, :h5=>:white_bishop, :h6=>:empty, :h7=>:empty, :h8=>:empty}

    expect(CHESSBOARD.map(&pos).to_h).to eq result_hash
  end

  it "can show occupied positions on the chessboard" do
    pos=Position.new(a1: :black_rook, a7: :white_queen, f4: :white_pawn, h8: :white_pawn)
    expect(CHESSBOARD.select(&pos.occupied)).to eq [:a1, :a7, :f4, :h8]
  end

  it "can show occupied positions for defined figure on the chessboard" do
    pos=Position.new(a7: :white_pawn, c7: :white_king, c8: :black_bishop, d8: :black_bishop, e1: :black_pawn, f3: :white_bishop)
    expect(CHESSBOARD.select(&pos.occupied(:bishop))).to eq [:c8, :d8, :f3]
  end

end