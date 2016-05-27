require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( '../models/album' )

class Artist

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{ @name }') RETURNING *"
    artist = SqlRunner.run_sql( sql ).first
    result = Artist.new( artist )
    return result
  end

  def albums()
    sql = "SELECT albums.* FROM albums
    INNER JOIN inventory ON albums.id = inventory.album_id
    WHERE inventory.artist_id = #{ @id} ORDER by albums.name"
    albums = SqlRunner.run_sql( sql )
    result = albums.map { |a| Album.new( a ) }
    return result
  end

  def self.destroy
    sql = "DELETE * FROM artists WHERE id = #{ id }"
    SqlRunner.run_sql( sql )
  end

  def self.all()
    sql = "SELECT * FROM artists ORDER BY name"
    artists = SqlRunner.run_sql( sql )
    result = artists.map { |a| Artist.new( a ) }
    return result
  end

  def self.find( id )
    artists = SqlRunner.run_sql( "SELECT * FROM artists WHERE id=#{id}" ) 
    result = Artist.new( artists.first )
    return result
  end

  def self.update( options )
      SqlRunner.run_sql(  
        "UPDATE artists SET 
          name='#{options['name']}'
          WHERE id=#{options['id']}"
      ) 
  end

  def self.searched(search)
    sql = "SELECT * FROM artists WHERE LOWER(name) LIKE '%#{search.downcase}%'"
    artists = SqlRunner.run_sql( sql )
    result = artists.map { |a| Artist.new( a ) }
      return result
    end


  # def self.destroy( id )
  #   SqlRunner.run_sql( "DELETE FROM artists WHERE id=#{id}" )
  # end

end