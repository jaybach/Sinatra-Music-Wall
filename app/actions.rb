# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  # "Add a song!"
  @songs = Song.all
  erb :'songs/songs'
end

get '/songs/new' do
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
    )
  @song.save
  redirect'/songs'
end