require 'spec_helper'

describe "pages/home" do

  before(:each) do
    @user = stub_model(User).as_new_record
    render
  end

  it "should display a welcome message" do
    rendered.should have_content('Welcome to Thyracker!')
  end

  context "anonymous visitor" do

    it "should display a sign-up form with all the user fields" do
      rendered.should have_field(:first_name)
      rendered.should have_field(:last_name)
      rendered.should have_field(:email)
      rendered.should have_field(:password)
      rendered.should have_field(:password_confirmation)
    end
  end
end
