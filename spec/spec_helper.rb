require("rspec")
require("pg")
require("list")
require("task")
require("pry")

DB = PG.connect({:dbname => "git_er_done_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
