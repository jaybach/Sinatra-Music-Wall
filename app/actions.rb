# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  # "Add a song!"
  @songs = Song.all
  erb :'songs/songs'
end
