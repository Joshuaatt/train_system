require('rspec')
require('pg')
require('spec_helper')
require('lines')

describe(Lines) do
  describe(".all") do
    it("tells you its name") do
      expect(Lines.all()).to(eq([]))
    end
  end
end
