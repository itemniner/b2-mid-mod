class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end
  
  def add_actor
    movie = Movie.find(params[:id])
    actor_id = Actor.where(name: params["name"]).ids[0]
    MovieActor.create(movie: movie, actor_id: actor_id)
  end
end