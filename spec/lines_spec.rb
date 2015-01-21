require('rspec')
require('pg')
require('spec_helper')
require('lines')

describe(Lines) do
  describe(".all") do
    it("tells you its line_name") do
      expect(Lines.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save lines to the database") do
      line = Lines.new({:line_name => "Red line", :station_id => 1})
      line.save()
      expect(Lines.all()).to(eq([line]))
    end
  end

  # describe("#stations") do
  #   it("returns an array of lines for that station") do
  #     test_station = Stations.new({:station_name => "Hawthorne Station", :id => 1})
  #     test_station.save()
  #     test_line = Lines.new({:line_name => "Red Line", :station_id => station_id })
  #     test_line.save()
  #     test_line2 = Lines.new({:line_name => "Blue Line", :station_id => station_id })
  #     test_line2.save()
  #     expect(test_station.lines()).to(eq([test_line, test_line2]))
  #   end
  # end

  describe("#==") do
    it("is the same line if it has the same name") do
      line1 = Lines.new({:line_name => "Blue line", :station_id => 1})
      line2 = Lines.new({:line_name => "Blue line", :station_id => 1})
      expect(line1).to(eq(line2))
    end
  end

    describe(".find") do
    it("returns a line by its ID number") do
      test_line = Lines.new({:line_name => "Red line", :station_id => 1})
      test_line.save()
      test_line_2 = Lines.new({:line_name => "Blue line", :station_id => 1})
      test_line_2.save()
      expect(Lines.find(test_line_2.station_id())).to(eq(test_line_2))
    end
  end

end
