require('spec_helper')

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

    describe(".find") do
      it("returns a list by its ID number") do
        test_list = List.new({:name => "Epicodus", :id => nil})
        test_list.save()
        test_list2 = List.new({:name => "Home stuff", :id => nil})
        test_list2.save()
        expect(List.find(test_list2.id())).to eq(test_list2)
      end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "learn SQL", :list_id => test_list.id(), :due_date => '2015-01-24'})
      test_task.save()
      test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id(), :due_date => '2015-01-24'})
      test_task2.save()  
      expect(test_list.tasks()).to eq([test_task, test_task2])
    end
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-01-24'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-01-24'})
      expect(task1).to(eq(task2))
    end
  end
end
