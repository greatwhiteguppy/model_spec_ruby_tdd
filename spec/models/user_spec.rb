require 'rails_helper'
RSpec.describe User do
  # This is our control
  context "With valid attributes" do
    it "should save" do
      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if first_name field is blank" do
      user = User.new(
            first_name: '',
            last_name: 'chang',
            email: 'schang@codingdojo.com'
        )
      expect(user).to be_invalid
    end

    it "should not save if last_name field is blank" do
        user = User.new(
            first_name: 'shane',
            last_name: '',
            email: 'schang@codingdojo.com'
        )
        expect(user).to be_invalid
    end

    it "should not save if email already exists" do
        user1 = User.new(
            first_name: 'sammi',
            last_name: 'kaufman',
            email: 'sammi@gmail.com'
        )
        user1.save
        user2 = User.new(
            first_name: 'sammi',
            last_name: 'dittloff',
            email: 'sammi@gmail.com'
        )
        expect(user2).to be_invalid
    end

    it "should not save if invalid email format" do
        user = User.new(
            first_name: 'george',
            last_name: 'beard',
            email: 'gbeard'
        )
        expect(user).to be_invalid
    end
  end
end
