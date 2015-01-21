require("rspec")
require("pg")
require("lines")
require("stations")

DB = PG.connect({:dbname => "train_system_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
  end
end
