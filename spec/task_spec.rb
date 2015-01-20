require('rspec')
require('task')
require('pg')
require('pry')

describe(Task) do

DB = PG.connect({:dbname => 'git_er_done_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to eq([])
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL"})
      test_task.save()
      expect(Task.all()).to eq([test_task]) #why is this returning an array???
    end
  end
end
