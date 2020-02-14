require "rails_helper"

RSpec.describe "On the index page", type: :feature do 
  describe "as a visitor" do
    before do
      @studio = Studio.create(name: "WB")
      @studio_1 = Studio.create(name: "Lucus Films")
      
      @harry_potter = Movie.create(name: "Harry Potter", studio: @studio)
      @departed = Movie.create(name: "Departed", studio: @studio)
      @rush_hour = Movie.create(name: "Rush Hour", studio: @studio)
      @star_wars_1 = Movie.create(name: "New Hope", studio: @studio_1)
      @star_wars_2 = Movie.create(name: "The Empire Strikes Back", studio: @studio_1)
      @star_wars_3 = Movie.create(name: "Return of the Jedi", studio: @studio_1)
    end
    
    it "see a list of all of the movie studios" do
      visit "/studios"

      within "#studio-#{@studio.id}" do
        expect(page).to have_content(@studio.name)
        expect(page).to have_content(@harry_potter.name)
        expect(page).to have_content(@departed.name)
        expect(page).to have_content(@rush_hour.name)
      end 

      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@star_wars_1)
        expect(page).to have_content(@star_wars_2)
        expect(page).to have_content(@star_wars_3)
      end
    end
  end
end