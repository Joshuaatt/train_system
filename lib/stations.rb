class Stations
  attr_reader(:station_name, :station_id)

  define_method(:initialize) do |attributes|
    @station_name = attributes.fetch(:station_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      station_name = station.fetch("station_name")
      id = station.fetch("station_id").to_i()
      stations.push(Lines.new({:station_name => station_name, :id => id}))
    end
    stations
  end

  define_method(:lines) do
    stations = []
    lines = DB.exec("SELECT * FROM lines WHERE id = #{self.id()};")
    lines.each() do |line|
      line_name = line.fetch("line_name")
      line_id = line.fetch("id").to_i()
      stations.push(Lines.new(:line_name => line_name, :station_id => station_id))
    end
    stations
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stations (station_name) VALUES ('#{@station_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_station = nil
    Stations.all().each() do |station|
      if station.stop_id().==(id)
        found_station = station
      end
    end
    found_station
 end

  define_method(:==) do |another_station|
    self.station_name().==(another_station.station_name()).&(self.id().==(another_station.id()))
  end
end
