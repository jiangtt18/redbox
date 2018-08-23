require_relative '../movie_billing/rental'

def _testRentalInitialize()
  movie = Movie.new('light',2)
  rental = Rental.new(movie, 4)
  rental.movie.title === 'light' && rental.movie.price_code === 2 && rental.days_rented === 4
end

puts "testRentalInitialize returns #{_testRentalInitialize()}"
