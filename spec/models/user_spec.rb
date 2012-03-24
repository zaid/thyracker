require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      first_name: 'Joe',
      last_name: 'Tester',
      email: 'joe@tester.ca',
      password: 'secret',
      password_confirmation: 'secret'
    }
  end

  it "should create a new user given valid attributes" do
    User.create!(@attr)
  end

  describe "validations" do

    it "should require a 'first_name'" do
      no_first_name_user = User.new(@attr.merge(first_name: ''))
      no_first_name_user.should_not be_valid
    end

    it "should require a 'last_name'" do
      no_last_name_user = User.new(@attr.merge(last_name: ''))
      no_last_name_user.should_not be_valid
    end

    it "should require an 'email'" do
      no_email_user = User.new(@attr.merge(email: ''))
      no_email_user.should_not be_valid
    end

    describe "passwords" do

      it "should require a password" do
        no_password_user = User.new(@attr.merge(password: ''))
        no_password_user.should_not be_valid
      end

      it "should require matching passwords" do
        mismatching_password_user = User.new(@attr.merge(password: 'invalid'))
        mismatching_password_user.should_not be_valid
      end
    end
  end
end
