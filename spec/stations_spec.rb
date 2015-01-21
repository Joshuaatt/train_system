require('rspec')
require('pg')
require('spec_helper')
require('lines')
require('stations')

  describe("#lines") do
    it("returns an array of lines for that station") do
      test_station = Stations.new({:station_name => "Hawthorne Station", :id => 1})
      test_station.save()
      test_line = Lines.new({:line_name => "Red Line", :station_id => station_id })
      test_line.save()
      test_line2 = Lines.new({:line_name => "Blue Line", :station_id => station_id })
      test_line2.save()
      expect(test_station.lines()).to(eq([test_line, test_line2]))
    end
  end

  describe("#station_id") do
    it("lets you read the line ID out") do
      test_line = Stations.new({:station_name => "Hawthorne", :id => 1})
      expect(test_line.id()).to(eq(1))
    end
  end
