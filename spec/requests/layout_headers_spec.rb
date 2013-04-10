require 'spec_helper'

describe "LayoutHeaders" do

  describe "GET /" do

    it "should have a 'header' div" do
      visit "/"
      page.should have_selector("div#header")
    end

    it "should have a 'header-logo' link" do
      visit "/"
      page.should have_selector("a#header-logo")
    end

    it "should have a 'header-navigation' div" do
      visit "/"
      page.should have_selector("div#header-navigation")
    end
  end
end
