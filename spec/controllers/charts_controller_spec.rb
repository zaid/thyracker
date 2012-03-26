require 'spec_helper'

describe ChartsController do

  describe 'access control' do

    it 'should require sign-ins' do
      get :index
      response.should redirect_to(root_path)
    end
  end

  describe "GET 'index'" do

    before(:each) do
      @user = FactoryGirl.create(:user)

      @samples = []
      @samples << FactoryGirl.create(:sample, user: @user, taken_on: 5.days.ago)
      @samples << FactoryGirl.create(:sample, user: @user, taken_on: 30.days.ago)
      @samples << FactoryGirl.create(:sample, user: @user, taken_on: 5.days.from_now)

      controller.stub!(:current_user).and_return(@user)
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
