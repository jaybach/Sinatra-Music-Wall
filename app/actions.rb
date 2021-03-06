# Homepage (Root path)
get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :songs
end

get '/songs' do
  # "Add a song!"
  @songs = Song.all
  erb :'songs/songs'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
    )
  if @song.save
    redirect'/songs'
  else
    erb :'/songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

get '/users/register' do
  @user = User.new
  erb :'users/register'
end

post '/users/register' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
  )
  # erb :'users/register'
  if @user.save
    redirect '/songs'
  else
    erb :'/users/register'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  name = params[:name]
  password = params[:password]

  user = User.find_by(name: name, password: password)

  if user
    session[:user_id] = user.id
  else
    session[:error] = "Sorry, but we were unable to log you in"
  end

  redirect '/songs'
end

