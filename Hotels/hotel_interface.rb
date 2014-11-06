require "./library.rb"

class HotelInterface
  def initialize
    @hotel_data = Library.new
    @hotel_data.get_data
  end

  def run
    print_hotel_names
    user_query
    show_hotel_info
  end

  def print_hotel_names
    puts "Hotels:"
    puts @hotel_data.library.keys
  end

  def user_query
    print "Which hotel? > "
    @query = gets.chomp
  end

  def show_hotel_info
    puts show_info(:city)
    puts show_info(:phone)
    puts show_info(:rooms)
  end

  def show_info(type)
    query_result = @hotel_data.library[@query]
    "#{ type.capitalize }: #{ query_result[type] }"
  end
end

hotel_interface = HotelInterface.new
hotel_interface.run
