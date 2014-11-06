class Library
  require "csv"

  attr_accessor :library

  def initialize
    @library = {}
  end

  def get_data
    CSV.foreach("hotels.csv", headers: true) do |row|
      hotel_name = row["Hotel"].strip
      hotel_info = {
        city: clean(row["City"]),
        phone: clean(row["Phone Number"]),
        rooms: clean(row["Number of Singles"]).to_i + clean(row["Number of Doubles"]).to_i
      }
      @library[hotel_name] = hotel_info
    end
  end

  def clean(data)
    data.gsub(/[^0-9a-zA-Z]/, "")
  end
end
