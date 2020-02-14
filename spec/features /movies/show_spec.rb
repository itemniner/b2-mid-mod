require "rails_helper"

RSpec.describe "On the index page", type: :feature do 
  describe "as a visitor" do
    before do
      @studio = Studio.create(name: "WB")
      @studio_1 = Studio.create(name: "Lucus Films")
      
      @rush_hour = Movie.create(name: "Rush Hour", creation_year: 1998, genre: "comedy", studio: @studio)

      @jackie = Actor.create(name: "Jackie Chan", age: 65)
      @chris = Actor.create(name: "Chris Tucker", age: 48)
      @ken = Actor.create(name: "Ken Leung", age: 47)
      @ray = Actor.create(name: "Ray Nguyen", age: 20)

      MovieActor.create(movie: @rush_hour, actor: @jackie)
      MovieActor.create(movie: @rush_hour, actor: @chris)
      MovieActor.create(movie: @rush_hour, actor: @ken)
    end
    
    it "see the movie name creation year and genre and list of all actors and average age." do
      visit "/movies/#{@rush_hour.id}"

      expect(page).to have_content(@rush_hour.name)
      expect(page).to have_content(@rush_hour.creation_year)
      expect(page).to have_content(@rush_hour.genre)

      expect(list_of_actors).to eq([@ken, @chris, @jackie])
      expect(average_age).to eq(45)
    end
  end
end