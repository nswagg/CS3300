
require 'rails_helper'
=begin
  The following is a test script using rspec to test the functionality of
  the models, view, and controller, confirming that our test cases have 
  been accounted for and each is passed. Prints errors otherwise
=end

RSpec.feature "Projects", type: :feature do
  #Using the framework defined by the Project.rb,
  #we create a new sample project
  context "Create new project" do
    before(:each) do
      visit new_project_path #Visits route to create new item
      within("form") do
        fill_in "Title", with: "Test title" #Fills the title dialogue with "Test Title"
      end
    end

    #If the project passes our tests, it prints a success message
    #and creates the object after filling in the description
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    #tests that the description is not blank. Return error if it is
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

    #creates the project for viewing by the user
  context "Update project" do
    #creates a new project for testing
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project) #Actually pulls the project from the database
    end

    scenario "should be successful" do
      within("form") do
        #fills in the sample description with a sample script
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project" #Clicks the button to update
      expect(page).to have_content("Project was successfully updated") #checks the page for success message
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: "" #Also tests for empty description, which is not allowed
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  #Testing the deletion of a project using the routes. It pulls from the database and 
  #destroys the sample porject item that was created for the purpose of our test. 
  context "Remove existing project" do
    #Creates a new project for testing
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path #pulls route and shows details of a project
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0) #confirms that we no longer have any projects available
    end
  end
end

