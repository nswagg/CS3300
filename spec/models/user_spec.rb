require 'rails_helper'

RSpec.describe 'User model testing', type: :model do
  before do
    @user = build(:user)
  end

  describe 'Validation' do
    it 'fail if email is empty' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end
