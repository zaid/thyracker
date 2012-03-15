require 'spec_helper'

describe "samples/new" do

  before(:each) do
    assign(:sample, stub_model(Sample).as_new_record)
    render
  end

  it "should show a valid form" do
    rendered.should have_selector("form", :id => "new_sample")
    rendered.should have_selector("select", :id => "sample_taken_on_1i")
    rendered.should have_selector("select", :id => "sample_taken_on_2i")
    rendered.should have_selector("select", :id => "sample_taken_on_3i")
    rendered.should have_field("TSH")
    rendered.should have_field("T3")
    rendered.should have_field("T4")
    rendered.should have_button("Create Sample")
  end
end
