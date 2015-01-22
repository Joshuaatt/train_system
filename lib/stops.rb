class Stops
  attr_reader(:stop_name, :id)

  define_method(:initialize) do |attributes|
    @stop_name = attributes.fetch(:stop_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|
      stop_name = stop.fetch("stop_name")
      id = stop.fetch("id").to_i()
      stops.push(Lines.new({:stop_name => stop_name, :id => id}))
    end
    stops
  end

  define_method(:lines) do
    stops = []
    lines = DB.exec("SELECT * FROM lines WHERE id = #{self.id()};")
    lines.each() do |line|
      line_name = line.fetch("line_name")
      line_id = line.fetch("id").to_i()
      stops.push(Lines.new(:line_name => line_name, :stop_id => stop_id))
    end
    stops
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (stop_name) VALUES ('#{@stop_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stop|
    self.stop_name().==(another_stop.stop_name()).&(self.id().==(another_stop.id()))
  end
end
