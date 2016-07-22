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

get ('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @store_brands = @store.brands()

  erb(:store)
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
  Brand.create({:name => params.fetch("brand_name"),:image => params.fetch("image")})

  redirect('/manage')
end

post ('/manage/stores/:id/brands') do
  store = Store.find(params.fetch("id").to_i())
  store.brands.delete_all()
  if params.has_key?("brand_ids")
    params.fetch("brand_ids").each() do |id|
      store.brands.push(Brand.find(id.to_i()))
    end
  end
  redirect("/manage/stores/#{store.id()}")
end
