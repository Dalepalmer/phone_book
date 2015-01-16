require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  @all_contacts = Contact.all()
  erb(:index)
end

post('/contacts')
  @contact = params.fetch('')
