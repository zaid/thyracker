require 'spec_helper'

describe "samples/index" do

  before(:each) do
    @user = FactoryGirl.create(:user) 

    @samples_list = [
      FactoryGirl.create(:sample, user: @user, taken_on: "2012-03-9", tsh: 4.5, t3: 2.2, t4: 5),
      FactoryGirl.create(:sample, user: @user, taken_on: "2012-02-9", tsh: 5.5, t3: 1.5, t4: 3)
    ]

    @samples = @user.samples

    render
  end

  it "should show a partial for each sample" do
    rendered.should render_template(:partial => "_sample", :count => @samples_list.size)
  end

  it "should have a link to add new samples" do
    rendered.should have_link("Add sample", :href => new_sample_path)
  end

  it "should have a samples table" do
    rendered.should have_selector("table", :class => "samples")
  end

  it "should have table column headers for 'Taken on', 'TSH', 'T3', 'T4' and 'Actions'" do
    %w[Taken\ on TSH T3 T4 Actions].each do |column_header|
      rendered.should have_selector("table thead tr th", :text => column_header)
    end
  end
end
