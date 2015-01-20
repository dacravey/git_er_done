require('rspec')
require('pg')
require('list')


DB = PG.connect({:dbname => 'git_er_done_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe(List) do
  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to eq([])
    end
  end

    describe("#name") do
      it("tells you its name") do
      list = List.new({:name => "Epicodus", :id => nil})
      expect(list.name()).to eq("Epicodus")
    end
  end

    describe("#id") do
      it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus", :id => nil})
      list.save()
      expect(list.id()).to be_an_instance_of(Fixnum)
    end
  end

  describe('#save') do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus", :id => nil})
      list2 = List.new({:name => "Housework", :id => nil})
      list.save()
      list2.save()
      expect(List.all()).to eq([list, list2])
    end
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end
end
