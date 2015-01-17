class Phone
  attr_reader(:phone_num)

  @@all = []

  define_method(:initialize) do |phone_num|
    @phone_num = phone_num
    @id = @@all.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_method(:phone_num) do
    @phone_num
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
    found_number = nil
    @@all.each do |number|
      if number.id().eql?(identification.to_i())
        found_number = number
      end
    end
    found_number
  end
end
