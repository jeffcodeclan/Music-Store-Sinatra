require( 'pg' )
require_relative('../db/sql_runner')

class Inventory

  attr_reader( :id, :artist_id, :album_id )


  def initialize( options )
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @album_id = options['album_id'].to_i
  end

  def save()
    sql = "INSERT INTO inventory (artist_id, album_id) VALUES (#{ @artist_id }, #{ @album_id }) RETURNING *"
    album = SqlRunner.run_sql( sql ).first
    result = Album.new( album )
    return result
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist = SqlRunner.run( sql )
    result = Artist.new( artist.first )
    return result
  end

  def self.destroy
    sql = "DELETE * FROM albums WHERE id = #{ id }"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run( sql )
    result = albums.map { |s| Album.new( s ) }
    return result
  end

  def self.find( id )
    albums = SqlRunner.run( "SELECT * FROM albums WHERE id=#{id}" ) 
    result = Album.new( albums.first )
    return result
  end

  def self.update( options )
      SqlRunner.run(  
        "UPDATE albums SET 
          name='#{options['name']}',
          artist_id=#{options['artist_id']}
          WHERE id=#{options['id']}"
      ) 
  end

end