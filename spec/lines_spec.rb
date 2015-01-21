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
      line = Lines.new({:line_name => "Red line", :id => nil})
      line.save()
      expect(Lines.all()).to(eq([line]))
    end
  end

  describe("#==") do
    it("is the same line if it has the same name") do
      line1 = Lines.new({:line_name => "Blue line", :id => nil})
      line2 = Lines.new({:line_name => "Blue line", :id => nil})
      expect(line1).to(eq(line2))
    end
  end

    describe(".find") do
    it("returns a line by its ID number") do
      test_line = Lines.new({:line_name => "Epicodus stuff", :id => nil})
      test_line.save()
      test_line_2 = Lines.new({:line_name => "Home stuff", :id => nil})
      test_line_2.save()
      expect(Lines.find(test_line_2.id())).to(eq(test_line_2))
    end
  end

end
