require_relative '../customer'

def _test_Calc_Rent()
  movie = Movie.new('Get Out', 3)
  rental = Rental.new(movie,1)
  customer = Customer.new('Jerry')
  customer.calc_rent(10,3,3) == 21
end


def _test_calc_price_when_no_rent()
  movie_details = {
        type: 'classic',
        costs: 1,
        rent: 0.5,
        max_days_without_rent: 1
    }
   name = 'Get Out'
   days_rented = 1
  customer = Customer.new('Elanie')
  customer.calc_price(movie_details, name, days_rented)==1
end


def _test_calc_price_when_has_rent()
  movie_details = {
        type: 'classic',
        costs: 1,
        rent: 0.5,
        max_days_without_rent: 1
    }
   name = 'Get Out'
   days_rented = 3
  customer = Customer.new('George')
  customer.calc_price(movie_details, name, days_rented)== 2

end


def _test_add_rental_when_has_an_error()
  movie = Movie.new('Get Out', 10)
  rental = Rental.new(movie,1)
  customer = Customer.new('Jerry')

  begin
  result = customer.add_rental(rental)
  rescue ArgumentError => e
    e.message == 'pirce_code of movie is not valid!'
  end
end


def _test_add_rental_when_has_one_rental()
  movie = Movie.new('Get Out', 3)
  rental = Rental.new(movie, 1)
  customer = Customer.new('Jerry')
  customer.add_rental(rental)
  customer.total_price == 1.5 &&
  customer.rentals.include?('Get Out') && customer.frequent_renter_points == 1
end


def _test_add_rental_when_have_two_rentals()
  movie = Movie.new('Get Out', 3)
  movie1 = Movie.new('Bird Man',0)
  rental = Rental.new(movie, 1)
  rental1 = Rental.new(movie1,4)
  customer = Customer.new('Jerry')
  customer.add_rental(rental)
  customer.add_rental(rental1)
  customer.total_price == 6.5 && customer.rentals.include?('Get Out') && customer.rentals.include?('Bird Man')&& customer.frequent_renter_points == 2
end

def _test_renter_points_new_release()
  type = 'new_release'
  days_rented = 3
  customer = Customer.new('Kremer')
  customer.update_renter_points(type,days_rented) == 2
end

def _test_renter_points_no_special_type()
  type = 'regular'
  days_rented = 3
  customer = Customer.new('Kremer')
  customer.update_renter_points(type,days_rented) == 1
end

puts "test_Calc_Rent returns #{ _test_Calc_Rent() }"
puts "test_calc_price_when_no_rent returns #{  _test_calc_price_when_no_rent() }"
puts "test_calc_price_when_has_rent returns #{ _test_calc_price_when_has_rent() }"
puts "test_add_rental_when_has_an_error returns #{_test_add_rental_when_has_an_error()}"
puts "test_add_rental_when_has_one_rental #{_test_add_rental_when_has_one_rental()}"
puts "test_add_rental_when_have_two_rentals returns #{_test_add_rental_when_have_two_rentals()}"
puts "test_renter_points_new_release returns #{_test_renter_points_new_release()}"
puts "test_renter_points_no_special_type returns #{_test_renter_points_no_special_type()}"
