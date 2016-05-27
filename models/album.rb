require( 'pg' )
require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :name, :genre, :price_buying, :price_selling, :quantity, :profit)

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
    @price_buying = options['price_buying'].to_i
    @price_selling = options['price_selling'].to_i
    @quantity = options['quantity'].to_i
    @profit = options['profit'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, genre, price_buying, price_selling, quantity, profit) VALUES ('#{ @name}', 
    '#{@genre}', #{@price_buying}, #{@price_selling}, #{@quantity}, #{@profit}) RETURNING *"
    album = SqlRunner.run_sql( sql ).first
    result = Album.new( album )
    return result
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist = SqlRunner.run_sql( sql )
    result = Artist.new( artist.first )
    return result
  end

  def self.destroy
    sql = "DELETE * FROM albums WHERE id = #{ id }"
    SqlRunner.run_sql( sql )
  end

  def profit
  result = (@price_selling - @price_buying) * @quantity
  return result 
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run_sql( sql )
    result = albums.map { |s| Album.new( s ) }
    return result
  end

  def self.find( id )
    albums = SqlRunner.run_sql( "SELECT * FROM albums WHERE id=#{id}" ) 
    result = Album.new( albums.first )
    return result
  end

  def self.update( options )
      SqlRunner.run_sql(  
        "UPDATE albums SET 
          name='#{options['name']}',
          artist_id=#{options['artist_id']}
          WHERE id=#{options['id']}"
      ) 
  end

  def self.searched(search)
    sql = "SELECT * FROM albums WHERE LOWER(name) LIKE '%#{search.downcase}%'"
    albums = SqlRunner.run_sql( sql )
    result = albums.map { |a| Album.new( a ) }
      return result
    end

end