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
  name = params.fetch("number")
  # search = params.fetch("search")
  Contact.new(name).save()
  @all_contacts = Contact.all()
  erb(:index)
end

post('/phone') do
  phone_num = params.fetch('number')
  @phone_num = Phone.new(phone_num)
  @phone_num.save()
  @contact = Contact.search_contact(params.fetch('contact_id').to_i())
  @contact.add_number(@phone_num)
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
