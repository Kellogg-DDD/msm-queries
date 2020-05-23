class ActorsController < ApplicationController

  def morgan
    actorID = Actor.where({ :name => "Morgan Freeman" }).first.id
    movieIDs = Character.where({ :actor_id => actorID }).pluck(:movie_id)
    @movies = Movie.where({ :id => movieIDs })

    render({ :template => "movie_templates/morgan.html.erb" })
  end
end
