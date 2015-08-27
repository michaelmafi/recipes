require('spec_helper')
require('./app')
set(:show_exceptions, false)

describe('The app', :type => :feature) do
  describe('the initial path') do
    it('visits the index') do
      visit('/')
      expect(page).to have_content('Recipes')
    end
  end

  describe('the recipes path') do
    it('visits the index page') do
      visit('/')
      click_link('Go to the recipes list')
      fill_in('name', with: "tomato")
      click_button('Submit')
      expect(page).to have_content("tomato")
    end
  end

end
