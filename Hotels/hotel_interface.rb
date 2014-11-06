require "./library.rb"
require "./null_hotel.rb"

class HotelInterface
  def initialize
    @hotels = Library.new
    @hotels.get_data
  end

  def run
    print_hotel_names
    loop do
      user_query
    end
  end

  def print_hotel_names
    puts "Hotels:"
    puts @hotels.library.keys
  end

  def user_query
    print "Which hotel? > "
    @query = gets.chomp
    show_result(@hotels.library[@query]) || NullHotel.new
  end

  def show_result(hotel)
    puts "City: #{ hotel[:city] }"
    puts "Phone Number: #{ hotel[:phone] }"
    puts "Number of Rooms: #{ hotel[:rooms] }"
  end
end

hotel_interface = HotelInterface.new
hotel_interface.run
