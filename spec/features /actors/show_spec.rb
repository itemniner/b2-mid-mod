require "rails_helper"

RSpec.describe "On the index page", type: :feature do 
  describe "as a visitor" do
    before do
      @studio = Studio.create(name: "WB")
      @studio_1 = Studio.create(name: "Lucus Films")
      
      @medallion = Movie.create(name: "The Medallion", studio: @studio)
      @shanghai = Movie.create(name: "Shanghai Noon", studio: @studio)
      @rush_hour = Movie.create(name: "Rush Hour", studio: @studio)
      @star_wars_1 = Movie.create(name: "New Hope", studio: @studio_1)
      @star_wars_2 = Movie.create(name: "The Empire Strikes Back", studio: @studio_1)
      @star_wars_3 = Movie.create(name: "Return of the Jedi", studio: @studio_1)

      MovieActor.create(movie: @rush_hour, actor: @jackie)
      MovieActor.create(movie: @shanghai, actor: @jackie)
      MovieActor.create(movie: @medallion, actor: @jackie)

      @jackie = Actor.create(name: "Jackie Chan", age: 65)
      @chris = Actor.create(name: "Chris Tucker", age: 48)
      @ken = Actor.create(name: "Ken Leung", age: 47)
      @ray = Actor.create(name: "Ray Nguyen", age: 20)
      @david = Actor.create(name: "David Holtcamp", age: 8)

      MovieActor.create(movie: @rush_hour, actor: @jackie)
      MovieActor.create(movie: @rush_hour, actor: @chris)
      MovieActor.create(movie: @rush_hour, actor: @ken)
      MovieActor.create(movie: @rush_hour, actor: @ray)
    end
    
    it "see the actor name, age and a list of the names of movies theyre in" do
      visit "/actors/#{@jackie.id}"

      expect(page).to have_content(@jackie.name)
      expect(page).to have_content(@jackie.age)
      expect(page).to have_content(@rush_hour.name)
      expect(page).to have_content(@shanghai.name)
      expect(page).to have_content(@medallion.name)
    end

    it "see a unqiue list of all actors worked with" do
      visit "/actors/#{@jackie.id}"

      expect(@jackie.associated_actors(@jackie.id)).to eq([@chris.name, @ken.name, @ray.name])
      expect(page).to have_content(@chris.name)
      expect(page).to have_content(@ken.name)
      expect(page).to have_content(@ray.name)
    end
  end
end