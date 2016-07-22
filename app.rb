require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb(:index)
end

get('/manage') do
  @stores = Store.all()
  @brands = Brand.all()
  @brand = Brand.find(3)

  erb(:manage)
end

post ('/stores/new') do
  Store.create({:name => params.fetch("store_name")})

  redirect('/manage')
end

get ('/manage/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  erb(:store_edit)
end

patch ('/manage/stores/:id') do
  store = Store.find(params.fetch("id").to_i())
  store.update({:name => params.fetch("name")})
  redirect("/manage/stores/#{store.id()}")
end

delete ('/manage/stores/:id') do
  store = Store.find(params.fetch("id").to_i())
  store.delete

  redirect('/manage')
end

post ('/brands/new') do
  Brand.create({:name => params.fetch("brand_name")})

  redirect('/manage')
end
