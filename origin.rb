# You are writing code for a company that builds software to track and invoice for movie rentals
# and are asked to add a new billing rule for classic movies.  Renting a classic movie costs $1 per day,
# plus an extra $0.50 for every day of the rental.
# The codebase was originally written by a junior engineer and the code is found below.  Refactor the
# code as you see necessary and add the new billing rule.  Be prepared to talk through your refactoring decisions.

# We will check that the code works, but are more interested in the refactoring decisions you make.

class Movie
  CHILDRENS = 2
  NEW_RELEASE = 1
  REGULAR = 0

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end

  def get_price_code
    @price_code
  end

  def price_code=(new_code)
    @price_code = new_code
  end

  def get_title
    @title
  end
end

class Rental
  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def get_days_rented
    @days_rented
  end

  def get_movie
    @movie
  end
end

class Customer
  def initialize(name)
    @rentals = []
    @name = name
  end

  def add_rental(arg)
    @rentals << arg
  end

  def get_name
    @name
  end

  def statement
    total_amount = 0.0
    frequent_renter_points = 0
    result = "Rental record for #{@name}\n"
    i = 0
    while(i < @rentals.length)
      each = @rentals[i]
      this_amount = 0.0
      # determine the amounts for each rental
      case each.get_movie.get_price_code
      when Movie::REGULAR
        this_amount += 2
        if each.get_days_rented > 2
          this_amount += (each.get_days_rented - 2) * 1.5
        end
      when Movie::NEW_RELEASE
        this_amount += (each.get_days_rented) * 3
      when Movie::CHILDRENS
        this_amount += 1.5
        if each.get_days_rented > 3
          this_amount += (each.get_days_rented - 3) * 1.5
        end
      else
        fail "Unknown movie?"
      end
      # Add frequent renter points
      frequent_renter_points += 1
      # Add a bonus point for a new release rental over 2 days
      if each.get_movie.get_price_code == Movie::NEW_RELEASE && each.get_days_rented > 1
        frequent_renter_points += 1
      end
      result += "\t #{each.get_movie.get_title} \t #{this_amount} \n "
      total_amount += this_amount
      result += "Amount owed is #{total_amount} \n You earned #{frequent_renter_points} frequent renter points. \n "
      i += 1
    end
    return result
  end
end
