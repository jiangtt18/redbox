class Rental

  attr_reader :days_rented, :movie

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

end
