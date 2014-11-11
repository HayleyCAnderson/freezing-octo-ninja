class Hotel
  attr_reader :name

  def initialize(data)
    @name = clean(data["Hotel"])
    @city = clean(data["City"])
    @phone = pretty_phone(clean(data["Phone Number"]))
    @rooms = clean(data["Number of Singles"]).to_i + clean(data["Number of Doubles"]).to_i
  end

  def information
    puts "Location: #{ @city }"
    puts "Phone Number: #{ @phone }"
    puts "Number of Rooms: #{ @rooms }"
  end

  private

  def clean(data)
    data.gsub(/[^\s\w]/, "").strip
  end

  def pretty_phone(number)
    number.insert(3, "-").insert(7, "-")
  end
end
