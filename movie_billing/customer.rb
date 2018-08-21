
class Customer

  attr_reader :name, :rentals, :price_breakdown, :total_price, :frequent_renter_points

  def initialize(name)
    @rentals = {}
    @name = name
    @frequent_renter_points = 0
    @total_price = 0
    @price_breakdown = ''
  end

  def add_rental(rental)
    raise ArgumentError, "pirce_code of movie is not valid!" unless is_rental_info_Valid(rental)

    movie = rental.movie
    moive_title = movie.title
    movie_details = Movie::MOVIE_TYPE[movie.price_code]
    movie_days_rented = rental.days_rented

    rentals[moive_title] = rental
    update_renter_points(movie_details[:type], movie_days_rented)
    update_total_price(movie_details, moive_title, movie_days_rented)
  end

  def update_renter_points(type,days_rented)
    # Add frequent renter points
    @frequent_renter_points += 1
     # Add a bonus point for a new release rental over 2 days
    @frequent_renter_points += 1 if type === 'new_release' && days_rented > 2
    @frequent_renter_points
  end

  def update_total_price(movie_details,name,movie_days_rented)
    @total_price += calc_price(movie_details,name,movie_days_rented)
  end


  def print_statement
    result = "Rental record for #{@name}\n"
    result += price_breakdown
    result += "Amount owed is #{total_price} \n You earned #{frequent_renter_points} frequent renter points. \n "

  end

  # private

  def is_rental_info_Valid(rental)
    price_code = rental.movie.price_code
    Movie::MOVIE_TYPE.include?(price_code)
  end


  def calc_price(movie_details, name,days_rented)
    days_without_rent = movie_details[:max_days_without_rent]
    cost = calc_cost(days_rented, movie_details[:costs])

    unitPrice = days_rented > days_without_rent ?  cost + calc_rent(days_rented, days_without_rent, movie_details[:rent] ) : cost

    @price_breakdown += "\t #{name} \t #{unitPrice} \n "

    unitPrice
  end

  def calc_cost(days, costPerDay)
    days * costPerDay
  end

  def calc_rent(days, no_rental_days, rentPerDay)
   (days - no_rental_days) * rentPerDay
  end

end
