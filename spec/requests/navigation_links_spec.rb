require 'spec_helper'

describe "NavigationLinks" do

  describe "GET /" do

    it "should have a 'Home' link" do
      visit "/"
      page.should have_selector("a", :href => root_path, :text => "Home")
    end

    it "should have a 'Contact' link" do
      visit "/contact"
      page.should have_selector("a", :href => contact_path, :text => 'Contact')
    end
  end
end
