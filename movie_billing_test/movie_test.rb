hash = Movie::MOVIE_TYPE[3]
puts hash[:type]

def _testMovieHash()
  regular = Movie::MOVIE_TYPE[0]
  regular[:type] === 'regular' && regular[:costs] === 2 && regular[:rent] === 1.5 && regular[:max_days_without_rent] === 2;
end

def _testMovieInitialize()
  movie = Movie.new('sunlight',2)
  return movie.title === 'sunlight' && movie.price_code === 2
end

def _testMovieAccessor()
  movie = Movie.new('moonlight',1)
  old_price_code = movie.price_code
  movie.price_code = 2
  return movie.price_code === 2
end

_testMovieHash()
_testMovieInitialize()
_testMovieAccessor()