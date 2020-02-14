class Movie < ApplicationRecord
  validates_presence_of :name
  belongs_to :studio

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def list_of_actors
    actors.order(:age).pluck(:name, :age).flatten
  end

  def average_age 
    actors.average(:age)
  end
end