require 'spec_helper'

describe "pages/home" do

  context 'common' do

    before(:each) do
      view.stub!(:signed_in?).and_return(true)
      render
    end

    it 'should display a welcome message' do
      rendered.should have_content('Welcome to Thyracker!')
    end
  end

  context "anonymous visitor" do

    before(:each) do
      @user = stub_model(User).as_new_record
      view.stub!(:signed_in?).and_return(false)
      render
    end

    it "should display a sign-up form with all the user fields" do
      rendered.should have_field(:first_name)
      rendered.should have_field(:last_name)
      rendered.should have_field(:email)
      rendered.should have_field(:password)
      rendered.should have_field(:password_confirmation)
    end
  end

  context 'logged-in user' do

    before(:each) do
      view.stub!(:signed_in?).and_return(true)
      render
    end

    it 'should not display a sign-up form' do
      rendered.should_not have_selector('form', :class => 'new_user')
    end

    it 'should display some information on how to get started' do
      rendered.should have_content('You can create new samples')
    end
  end
end
