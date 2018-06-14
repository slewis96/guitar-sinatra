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
    erb :"/guitars/index"
  end

end
