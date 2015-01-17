class Contact
  attr_reader(:contact, :id, :phone_num)

  @@all = []

  define_method(:initialize) do |contact|
    @contact = contact
    @id = @@all.length().+(1)
    @phone_num = []

  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@all
  end

  define_singleton_method(:clear) do
    @@all = []
  end

  define_method(:phone_num) do
    @phone_num
  end

  define_method(:save) do
    @@all.push(self)
  end

  define_method(:add_number) do |phone_num|
    @phone_num.push(phone_number)
  end

  define_singleton_method(:search_contact) do |identification|
    found_contact = nil
    @@all.each do |contact|
      if contact.id().eql?(identification)
        found_contact = contact
      end
    end
    found_contact
  end
end
