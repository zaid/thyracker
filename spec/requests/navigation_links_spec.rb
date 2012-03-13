require 'spec_helper'

describe "NavigationLinks" do

  describe "GET /" do

    it "should have a 'Home' link" do
      visit "/"
      page.should have_selector("a", :href => root_path, :text => "Home")
    end
  end
end
