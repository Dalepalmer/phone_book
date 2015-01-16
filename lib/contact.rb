class Contact
  attr_reader(:contact)

  @@all = []

  define_method(:initialize) do |attributes|
    @contact = attributes.fetch(:contact)
    # @phone_num = attributes.fetch(:phone_num)

  end

  define_singleton_method(:all) do
    @@all
  end

  define_singleton_method(:clear) do
    @@all = []
  end

  define_method(:save) do
    @@all.push(self)
  end

  define_singleton_method(:search_contact) do |search_contact|
    contact = []
    @@all.each do |contacts|
      if contacts.contact() == search_contact
        contact.push(contacts)
      end
    end
    return contact
  end
end
