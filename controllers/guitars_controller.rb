class GuitarsController <Sinatra::Base

  # Says where views are
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new{ File.join(root, "views")}

  #INDEX
  get '/' do
    @title = "Home"
    erb :"/index"
  end
  #INDEX
  get '/guitars' do
    @title = "Guitars"
    @guitars = Guitars.all
    erb :"guitars/index"
  end

  #NEW
  get '/guitars/new' do
    @title = "New guitar entry"
    @guitar = Guitars.new
    erb :"guitars/new"
  end

  #EDIT
  get '/guitars/:id/edit' do
    id = params[:id].to_i
    @title = "Edit guitar entry"
    @guitar = Guitars.find(id)
    erb :"guitars/edit"
  end

  #UPDATE
  put '/guitars/:id' do
    id = params[:id].to_i
    guitar = Guitars.find(id)
    guitar.name = params[:name]
    guitar.price = params[:price]
    guitar.img = params[:img]
    guitar.description = params[:description]
    guitar.save
    redirect "/guitars/#{id}"
  end

  #CREATE
  post '/guitars/' do
    guitar = Guitars.new
    guitar.name = params[:name]
    guitar.price = params[:price]
    guitar.img = params[:img]
    guitar.description = params[:description]
    guitar.save
    redirect "/guitars"
  end

  #SHOW
  get '/guitars/:id' do
    id = params[:id].to_i
    @guitar = Guitars.find(id)
    @title = @guitar.name
    erb :"guitars/show"
  end

  #DESTROY
  delete '/guitars/:id' do
    id = params[:id].to_i
    Guitars.destroy(id)
    redirect "/guitars"
  end
end
