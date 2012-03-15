require 'spec_helper'

describe "samples/index" do

  before(:each) do
    @samples_list = [
      Factory(:sample, taken_on: "2012-03-9", tsh: 4.5, t3: 2.2, t4: 5),
      Factory(:sample, taken_on: "2012-02-9", tsh: 5.5, t3: 1.5, t4: 3)
    ]

    @samples = Sample.all

    render
  end

  it "should show a partial for each sample" do
    rendered.should render_template(:partial => "_sample", :count => @samples_list.size)
  end

  it "should have a link to add new samples" do
    rendered.should have_link("Add sample", :href => new_sample_path)
  end
end
