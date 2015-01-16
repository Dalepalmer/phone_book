class Contact
  attr_reader(:contact, :phone_num)

  @@all = []

  define_method(:initialize) do |attributes|
    @contact = attributes.fetch(:contact)
    @phone_num = attributes.fetch(:phone_num)

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

  define_singleton_method(:search_contact) do |search_item|
    phone_numbers = []
    @@all.each do |contacts|
      if contacts.contact() == search_item
        phone_numbers.push(contacts)
      end
    end
    return phone_numbers
  end
end
