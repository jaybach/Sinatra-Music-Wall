# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  # "Add a song!"
  @songs = Song.all
  erb :'songs/index'
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

