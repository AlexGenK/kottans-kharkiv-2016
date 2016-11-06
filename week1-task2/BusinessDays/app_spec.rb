require './app.rb'

describe BusinessDays do

  it "may select business days" do
    z=BusinessDays.new(start: Date.parse('2016-05-01'), region: :fr).lazy.reject{ |d| d.wday == 5 }.take(10).reduce{|accum, item| "#{accum} #{item}"}
    expect(z).to eq "2016-05-02 2016-05-03 2016-05-04 2016-05-09 2016-05-10 2016-05-11 2016-05-12 2016-05-17 2016-05-18 2016-05-19"
  end

end