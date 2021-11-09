require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  #using the projectcontroller with its methods, calls the "index" method
  #to check for a successful response
  #Are all projects displayed by index when the method is called?
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  #uses the projectcontroller to call the show method which
  #displays the details of an individual project with it's title and description
  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project } #the sample project is passed in as a parameter. 
      expect(response).to be_success
    end
  end
end