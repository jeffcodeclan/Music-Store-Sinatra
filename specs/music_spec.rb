require('minitest/autorun')
require_relative('../models/album' )


class TestAlbum < Minitest::Test

  def setup
    options = {
      "name" => "Ok",
      "genre" => "Indie",
      "price_buying"  => 5,
      "price_selling" => 10,
      "quantity" => 50,
      "profit" => 100
    }
    
    @album = Album.new(options)
  end

  def test_price_buying
    assert_equal(5, @album.price_buying())
  end 

  def test_price_selling
    assert_equal(10, @album.price_selling())
  end 

  def test_quantity
    assert_equal(50, @album.quantity())
  end 

  def test_profit
    assert_equal(250, @album.profit())
  end 

end
