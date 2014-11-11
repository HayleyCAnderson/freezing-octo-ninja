require "./hotel.rb"

class Library
  require "csv"

  def initialize
    @library = []
  end

  def create
    CSV.foreach("hotels.csv", headers: true) do |row|
      @library << Hotel.new(row)
    end
  end

  def list
    @library.each { |hotel| puts hotel.name }
  end

  def find(query)
    @library.find { |hotel| hotel.name == query }
  end
end
