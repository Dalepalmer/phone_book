class Phone
  attr_reader(:phone_num)

  @@all = []

  define_method(:initialize) do |attributes|
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

  define_singleton_method(:search_number) do |search_number|
    number = []
    @@all.each do |numbers|
      if numbers.phone_num() == search_number
        number.push(numbers)
      end
    end
    return number
  end
end
