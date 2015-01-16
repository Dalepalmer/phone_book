require('rspec')
require('contact')
require('phone')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#save") do
    it("Saves a contact object in the class") do
      test_contact = Contact.new("Becky")
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it("Clears the the object that holds the class information") do
      test_contact = Contact.new({:contact =>"Becky", :phone_num => 3305554747})
      test_contact.save()
      Contact.clear()
      expect(Contact.clear()).to(eq([]))
    end
  end

  describe("#add_number") do
    it("adds a new number to a contact") do
      test_contact = Contact.new("Becky")
      test_number = Phone.new(3305554747)
      test_contact.add_number(test_number)
      expect(test_contact.phone_num()).to(eq([test_number]))
    end
  end


  describe(".search_contact") do
    it("searchs for the contact's phonenumber") do
      test_contact = Contact.new({:contact => "Becky"})
      test_contact.save()
      test_contact_2 = Contact.new({:contact => "Greg"})
      test_contact_2.save()
      expect(Contact.search_contact(test_contact.id())).to(eq(test_contact))
      expect(Contact.search_contact(test_contact_2.id())).to(eq(test_contact_2))
    end
  end
end
