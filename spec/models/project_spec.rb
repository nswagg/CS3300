require "rails_helper"

#Defines a new project model
RSpec.describe Project, type: :model do
  context "validations tests" do
    #Validates the existence of the description
    it "ensures the description is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false) #Input validation for the project
    end

    
    it "should be able to save project" do
      #Creates a new project
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true) #Calls the project method "save" to ensure that it works
    end
  end

  context "scopes tests" do
    #defines some parameters for the project values. Some are overwritten in the tests
    #but establishes frame for test cases
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      #Creates three project objects using the above parameters
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      #returns the number of projects before the test features deletes them
      expect(Project.count).to eq(3)
    end

  end
end

