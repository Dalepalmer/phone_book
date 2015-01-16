require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  @all_contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  name = params.fetch('name')
  Contact.new(name).save()
  @contacts = Contact.all()
  erb(:index)
end

post('/phone') do
  phone_num = params.fetch('number')
  @phone_num = Phone.new(number)
  @phone_num.save()
  @contact = Contact.search_contact(params.fetch('contacts.id').to_i())
