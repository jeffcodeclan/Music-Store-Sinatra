require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')

require_relative( './models/album' )
require_relative( './models/artist' )
require_relative( './models/inventory' )
require_relative( './controllers/album_controller.rb' )
require_relative( './controllers/artist_controller.rb' )

get( '/' ) do 
  # return "hi"
  @artists = Artist.all()
  @albums = Album.all()
  erb( :index )
end


get( '/stock' ) do 
  if params[:search]
  @artists = Artist.searched(params[:search])
else
  @artists = Artist.all()
  @albums = Album.all()
end
  erb( :index )
end

get( '/stock' ) do 
  if params[:search]
  @albums = Album.searched(params[:search])
else
  @artists = Artist.all()
  @albums = Album.all()
end
  erb( :index )
end

# get( '/stock' ) do 
#   if params[:search]
#   @artists = Artist.all()
#   @albums = Album.all()
#   erb( :index )
# end

