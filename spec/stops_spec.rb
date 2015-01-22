require('rspec')
require('pg')
require('spec_helper')
require('lines')
require('stations')
require('stops')

describe("#lines") do
  it("returns an array of lines for that station") do
    test_stop = Stops.new({:stop_name => "Hawthorne Station", :id => nil})
    test_stop.save()
    test_line = Lines.new({:line_name => "Red Line", :stop_id => stop_id })
    test_line.save()
    test_line2 = Lines.new({:line_name => "Blue Line", :stop_id => stop_id })
    test_line2.save()
    expect(test_station.lines()).to(eq([test_line, test_line2]))
  end
end

describe("#stop_id") do
  it("lets you read the line ID out") do
    test_line = Stops.new({:stop_name => "Hawthorne", :id => 1})
    expect(test_line.id()).to(eq(1))
  end
end
