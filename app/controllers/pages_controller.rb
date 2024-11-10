class PagesController < ApplicationController
  def square_new
    render({ :template => "square_new" })
  end

  def square_results
    @num = params.fetch("number")
    @num_squared = @num.to_f**2

    render({ :template => "square_results" })
  end

  def square_root_new
    render({ :template => "square_root_new" })
  end

  def square_root_results
    @num = params.fetch("user_number")
    @num_root = @num.to_f**(1/2.0)

    render({ :template => "square_root_results" })
  end

  def payment_new
    render({ :template => "payment_new" })
  end

  def payment_results
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @pv = params.fetch("user_pv").to_f
  
    monthly_rate = @apr/100/12
    monthly_periods = @years*12.0
  
    numer = monthly_rate * @pv
    denom = 1 - (1 + monthly_rate) ** (-monthly_periods)
  
    @payment = numer / denom

    render({ :template => "payment_results" })
  end

  def random_new
    render({ :template => "random_new" })
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
  
    @random_number = rand(@min..@max)

    render({ :template => "random_results" })
  end
end
