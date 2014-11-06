require "./library.rb"
require "./hotel.rb"
require "./null_hotel.rb"

class HotelInterface
  def initialize
    @hotels = Library.new
    @hotels.create
  end

  def run
    show_hotels
    loop do
      get_query
    end
  end

  def show_hotels
    puts "Hotels:"
    @hotels.list
  end

  def get_query
    print "Which hotel? > "
    query = gets.chomp
    show_result(@hotels.find(query) || NullHotel.new)
  end

  def show_result(hotel)
    puts
    puts hotel.information
  end
end

hotel_interface = HotelInterface.new
hotel_interface.run
