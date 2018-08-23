class Movie
  #CLASSIC = 3
  # CHILDRENS = 2
  # NEW_RELEASE = 1
  # REGULAR = 0

  MOVIE_TYPE = {
    3 => {
        type: 'classic',
        costs: 1,
        rent: 0.5,
        max_days_without_rent: 0
    },
    2 => {
        type: 'children',
        costs: 1.5,
        rent: 1.5,
        max_days_without_rent: 3
    },
    1 => {
        type: 'new_release',
        costs: 0,
        rent: 3,
        max_days_without_rent: 0
      },
    0 => {
        type: 'regular',
        costs: 2,
        rent: 1.5,
        max_days_without_rent: 2
      },
  }

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end

end
