require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get('/') do
  @all_contacts = Contact.all()
  erb(:index)
end

post('/contact') do
  contact = params.fetch('name')
  phone_num = params.fetch('number')
  Contact.new([contact, phone_num]).save()
  @all_contacts = Contact.all()
  erb(:index)
end

post('/phone') do
  phone_num = params.fetch('new_number')
  @number = Phone.new(phone_num)
  @number.save()
  @contact = Contact.search_contact(params.fetch('contact_id').to_i())
  @contact.add_number(@number)
  erb(:contact)
end

get('/phone/:id') do
  @phone = Phone.search_number(params.fetch('id'))
  erb(:phone)
end

get('/contacts/:id') do
  @contact = Contact.search_contact(params.fetch('id').to_i())
  erb(:contact)
end
