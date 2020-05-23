class DirectorsController < ApplicationController

  def last
    youngest = Director.all.order({ :dob => :desc }).first
    @youngestname = youngest.name
    @youngestdob = youngest.dob
    render({ :template => "movie_templates/last.html.erb" })
  end

  def under_55
    @directors = Director.where("dob >= ?", 55.years.ago)
    render({ :template => "movie_templates/under_55.html.erb" })
  end

  def francis
    directorID = Director.where({ :name => "Francis Ford Coppola" }).first.id
    @movies = Movie.where({ :director_id => directorID })
    render({ :template => "movie_templates/francis.html.erb" })
  end

end
