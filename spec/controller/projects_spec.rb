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

  # Spec controller for logging in the user
  # For guide: https://www.matthewhoelter.com/2019/09/12/setting-up-and-testing-rails-6.0-with-rspec-factorybot-and-devise.html
  login_user

    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description", :status => "draft" }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Article.create! valid_attributes
            get :index, params: {}, session: valid_session

            # Make sure to swap this as well
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end
end