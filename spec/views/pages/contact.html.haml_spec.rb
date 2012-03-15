require 'spec_helper'

describe "pages/contact" do

  before(:each) do
    render
  end

  it "should link to the Github project page" do
    rendered.should have_link("Github", :href => "https://github.com/zaid/thyracker")
  end
end
