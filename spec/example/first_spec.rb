require "rails_helper"

#This is a test, trying out test-driven development.
#The following is a sample function which tests that the input
#is equal to what is expected
RSpec.describe "The math below is wrong..." do
  it "should equal 42 but we said 43" do
    expect(6 * 7).to eq(42)
  end
end

#The following tests that a new string is empty when we 
#initialize it
RSpec.describe "hello spec" do
    # ...
    describe String do
        let(:string) { String.new }
        it "should provide an empty string" do
            expect(string).to eq("")
        end
    end
end