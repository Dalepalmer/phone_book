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
end
