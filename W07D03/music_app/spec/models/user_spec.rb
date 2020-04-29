require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(5).on(:create) }

  
  subject(:user1) { User.create(email: "bob@bob.me", password: "bobcats")}
  
  describe "User#is_password?" do
    it "confirms true if password is correct" do
      expect(user1.is_password?("bobcats")).to eq(true)
    end
  end

  describe "User#reset_session_token!" do
    it "resets session token for user" do
      original_token = user1.session_token
      user1.reset_session_token!
      expect(user1.session_token).not_to eq(original_token)
    end
  end

  describe "User::get_by_credentials" do
    it "returns user if pass & email is correct" do
      expect(User.get_by_credentials("bob@bob.me", "bobcats")).to eq(user1)
    end
  end

end
