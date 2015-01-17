require('rspec')
require('phone')
require('contact')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe(".save") do
    it("Saves a phone object in the class") do
      test_contact = Phone.new({:phone_num => 3305554747})
      test_contact.save()
      expect(Phone.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it("Clears the the object that holds the class information") do
      test_contact = Phone.new({:contact =>"Becky", :phone_num => 3305554747})
      test_contact.save()
      Phone.clear()
      expect(Phone.clear()).to(eq([]))
    end
  end
  describe(".search_number") do
    it("returns a vehicle by its id number") do
      test_1 = Phone.new(3305554925)
      test_1.save()
      test_2 = Phone.new(3305554177)
      test_2.save()
      expect(Phone.search_number(test_1.id())).to(eq(test_1))
    end
  end
end
