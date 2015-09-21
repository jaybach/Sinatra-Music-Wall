# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  # "Add a song!"
  erb :'songs/songs'
end
