class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

    def associated_actors(actor_id)
    #if actor plays in the same movie as this actor print name
    Movie.joins(:actor).where('actor_id = ?', actor_id)
  end
end