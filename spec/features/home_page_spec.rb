require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  #This names the test case
  scenario "The visitor should see projects" do
    visit root_path #actually visits the root using the routing
    #Expects the page to print out our projects, like in the controller
    expect(page).to have_text("Projects")
  end
end