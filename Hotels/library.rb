class Library
  require "csv"

  attr_accessor :library

  def initialize
    @library = {}
  end

  def get_data
    CSV.foreach("hotels.csv", headers: true) do |row|
      hotel_name = clean(row["Hotel"])
      hotel_info = {
        city: clean(row["City"]),
        phone: pretty_phone(clean(row["Phone Number"])),
        rooms: clean(row["Number of Singles"]).to_i + clean(row["Number of Doubles"]).to_i
      }
      @library[hotel_name] = hotel_info
    end
  end

  private

  def clean(data)
    data.gsub(/[^\s\w]/, "").strip
  end

  def pretty_phone(number)
    number.insert(3, "-").insert(7, "-")
  end
end
