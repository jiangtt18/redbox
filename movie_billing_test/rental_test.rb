def _testRentalInitialize()
  movie = Movie.new('light',2)
  rental = Rental.new(movie, 4)
  return rental.movie.title === 'light' && rental.movie.price_code === 2 && rental.days_rented === 4
end

_testRentalInitialize()
