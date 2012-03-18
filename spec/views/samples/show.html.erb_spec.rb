require 'spec_helper'

describe "samples/show" do

  before(:each) do
    @sample = stub_model(Sample, taken_on: "2012-03-08", tsh: 1.5, t3: 3.3, t4: 0.15)
    render
  end

  it "should show all available fields" do
    rendered.should have_content(@sample.taken_on)
    rendered.should have_content(@sample.tsh)
    rendered.should have_content(@sample.t3)
    rendered.should have_content(@sample.t4)
  end

  it "should show a 'Delete' link" do
    rendered.should have_link("Delete")
  end

  it "should show a 'Update' link" do
    rendered.should have_link("Update")
  end
end
