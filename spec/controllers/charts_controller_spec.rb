require 'spec_helper'

describe ChartsController do

  describe "GET 'index'" do

    before(:each) do
      @samples = []
      @samples << FactoryGirl.create(:sample, taken_on: 5.days.ago)
      @samples << FactoryGirl.create(:sample, taken_on: 30.days.ago)
      @samples << FactoryGirl.create(:sample, taken_on: 5.days.from_now)
    end

    it "returns http success" do
      get :index
      response.should be_success
    end

    it "should assign samples (asc on the taken_on field) to :samples" do
      get :index
      assigns(:samples).should_not be_nil
      assigns(:samples).first.should == @samples.second
      assigns(:samples).second.should == @samples.first
      assigns(:samples).last.should == @samples.last
    end
  end
end
