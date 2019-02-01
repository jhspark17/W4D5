require 'rails_helper'
#DON'T FORGET ASSOCIATIONS

RSpec.describe User, type: :model do
  # subject(:user_test) {FactoryBot.create(:user)} 
  subject(:user_test) { User.new(password: 'password', username: 'Harry Popper')}
  describe "validations" do 
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "User::find_by_credentials" do
    it "should find user with username" do
      expect (User.find_by_credentials(username: user_test.username, password: user_test.password)).to include(user_test)
    end
  end

  describe "password encryption" do
    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with(user_test.password)
    end

    it "doesn't save password to database" do
      user = User.find_by(username: user_test.username)
      expect(user.password).to be_nil
    end
  end
end