class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do

    artist = Artist.find_or_create_by(name: params["artist_name"])
        genre = Genre.find_by_id(params["genres"].to_i)
        binding.pry
    @song = Song.create(name: params["name"], artist: artist)

    redirect '/songs/:slug'

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end



end
