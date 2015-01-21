class Lines
  attr_reader(:line_name, :station_id)

  define_method(:initialize) do |attributes|
    @line_name = attributes.fetch(:line_name)
    @station_id = attributes.fetch(:station_id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM lines;")
    lines = []
    returned_lines.each() do |line|
      line_name = line.fetch("line_name")
      station_id = line.fetch("station_id").to_i()
      lines.push(Lines.new({:line_name => line_name, :station_id => station_id}))
    end
    lines
  end

  # define_method(:stations) do
  #   lines = []
  #   stations = DB.exec("SELECT * FROM stations WHERE id = #{self.id()};")
  #   stations.each() do |station|
  #     station_name = station.fetch("station_name")
  #     station_id = station.fetch("id").to_i()
  #     lines.push(Stations.new(:station_name => station_name, :id => id))
  #   end
  #   lines
  # end

  define_method(:save) do
    result = DB.exec("INSERT INTO lines (line_name, station_id) VALUES ('#{@line_name}', #{@station_id});")
  end


  define_method(:==) do |another_list|
    self.line_name().==(another_list.line_name()).&(self.station_id().==(another_list.station_id()))
  end

  define_singleton_method(:find) do |id|
    found_line = nil
    Lines.all().each() do |line|
      if line.station_id().==(id)
        found_line = line
      end
    end
    found_line
 end

end
