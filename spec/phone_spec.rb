require('rspec')
require('phone')
require('contact')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe(".save") do
    it("Saves a phone object in the class") do
      test_contact = Contact.new({:contact => "Becky"})
      test_contact.save()
      test_contact = Phone.new({:phone_num => 3305554747})
      test_contact.save()
      expect(Contact.phone_num()).to(eq(test_contact))
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
end
