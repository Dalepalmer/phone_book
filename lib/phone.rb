class Phone
  attr_reader(:phone_num)

  @@all = []

  define_method(:initialize) do |phone_num|
    @phone_num = phone_num
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

  define_singleton_method(:search_number) do |identification|
    found_contact = nil
    @@all.each do |contact|
      if contact.id().eql?(identification)
        found_contact = contact
      end
    end
    found_contact
  end
end
