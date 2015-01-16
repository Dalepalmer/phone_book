require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe(".save") do
    it("Saves a contact object in the class") do
      test_contact = Contact.new({:contact => "Becky", :phone_num => 3305554747})
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

  describe(".search_contact") do
    it("searchs for the contact's phonenumber") do
      test_contact = Contact.new({:contact => "Becky", :phone_num => 3305554747})
      test_contact.save()
      test_contact_2 = Contact.new({:contact => "Greg", :phone_num => 3305554646})
      test_contact_2.save()
      expect(Contact.search_contact("Becky")).to(eq([test_contact]))
    end
  end
end
