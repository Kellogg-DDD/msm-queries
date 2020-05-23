class MoviesController < ApplicationController

  def casablanca
    casablanca = Movie.where({ :title => "Casablanca" }).first
    @yearsago = Date.today.strftime("%Y").to_i - casablanca.year.to_i 

    render({ :template => "movie_templates/cb.html.erb" })
  end
  
  def before2k
    @movies = Movie.where("year < ?", 2000).order({ :year => :asc })
    
    render({ :template => "movie_templates/pre2000.html.erb" })
  end
end
