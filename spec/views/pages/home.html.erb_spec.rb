require 'spec_helper'

describe "pages/home" do

  before(:each) do
    render
  end

  it "should display a welcome message" do
    rendered.should have_content('Welcome to Thyracker!')
  end
end
