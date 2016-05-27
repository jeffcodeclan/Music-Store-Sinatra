require 'pry-byebug'
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/inventory.rb')

# Artist.delete_all()
# Album.delete_all()
# Inventory.delete_all()

artist1 = Artist.new({ 'name' => 'David Zowie'})
artist2 = Artist.new({ 'name' => 'No Direction'})
artist3 = Artist.new({ 'name' => 'Bateoven'})
artist1 = artist1.save
artist2 = artist2.save
artist3 = artist3.save


album1 = Album.new({ 'name' => 'Rock Baby Rock','genre' => 'Rock','price_buying' => 5, 'price_selling' => 10, 
  'quantity' => 10, 'profit' => 5})
album2 = Album.new({ 'name' => 'Pop Baby Pop','genre' => 'Pop', 'quantity' => 7, 'price_buying' => 5, 'price_selling' => 10, 'profit' => 5 })
album3 = Album.new({ 'name' => 'Slow Nice Stuff','genre' => 'Classical', 'quantity' => 4, 
 'price_buying' => 5, 'price_selling' => 10, 'profit' => 5 })
album1 = album1.save
album2 = album2.save
album3 = album3.save

# price_buying1 = Album.new({ 'price_buying' => 5})
# price_buying2 = Album.new({ 'price_buying' => 5})
# price_buying3 = Album.new({ 'price_buying' => 5})
# price_buying1 = price_buying1.save
# price_buying2 = price_buying2.save
# price_buying3 = price_buying3.save

# price_selling1 = Album.new({ 'price_selling' => 10})
# price_selling2 = Album.new({ 'price_selling' => 10})
# price_selling3 = Album.new({ 'price_selling' => 10})
# price_selling1 = price_selling1.save
# price_selling2 = price_selling2.save
# price_selling3 = price_selling3.save

# quantity1 = Album.new({ 'quantity' => 10})
# quantity2 = Album.new({ 'quantity' => 7})
# quantity3 = Album.new({ 'quantity' => 4})
# quantity1 = quantity1.save
# quantity2 = quantity2.save
# quantity3 = quantity3.save


inventory1 = Inventory.new({'artist_id' => artist1.id, 'album_id' => album1.id}).save()
inventory2 = Inventory.new({'artist_id' => artist2.id, 'album_id' => album2.id}).save()
inventory3 = Inventory.new({'artist_id' => artist3.id, 'album_id' => album3.id}).save()

# i1 = inventory1.save
# i2 = inventory2.save
# i3 = inventory3.save

 
