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

  # describe(".clear") do
  #   it("Clears the the object that holds the class information") do
  #     test_
end
