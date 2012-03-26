require 'spec_helper'

describe SamplesController do

  def sign_in
    @user = FactoryGirl.create(:user)
    controller.stub!(:current_user).and_return(@user)
    @user
  end

  describe 'access control' do

    it "should require sign-in for 'new'" do
      get :new
      response.should redirect_to root_path
    end

    it "should require sign-in for 'create'" do
      post :create, :sample => {}
      response.should redirect_to root_path
    end

    it "should require sign-in for 'show'" do
      get :show, :id => ''
      response.should redirect_to root_path
    end

    it "should require sign-in for 'update'" do
      put :update, :id => '', :sample => {}
      response.should redirect_to root_path
    end

    it "should require sign-in for 'destroy'" do
      delete :destroy, :id => ''
      response.should redirect_to root_path
    end
  end

  describe "GET 'new'" do

    before(:each) do
      @user = sign_in
    end

    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    context "success" do

      before(:each) do
        @user = sign_in

        @attr = {
          taken_on: "2012-03-08",
          tsh: 3.4,
          t3: 6.2,
          t4: 2.2,
        }
      end

      it "should add a sample" do
        lambda do
          post :create, :sample => @attr
        end.should change(@user.samples, :count).by(1)
      end

      it "should redirect to the sample 'show' page" do
        post :create, :sample => @attr
        response.should redirect_to(sample_path(assigns(:sample)))
      end
    end

    context "failure" do

      before(:each) do
        @user = sign_in

        @attr = {
          taken_on: "",
          tsh: 0,
          t3: 0,
          t4: 0,
        }
      end

      it "should not add a sample" do
        lambda do
          post :create, :sample => @attr
        end.should_not change(@user.samples, :count)
      end

      it "should render the 'new' template" do
        post :create, :sample => @attr
        response.should render_template('new')
      end
    end
  end

  describe "GET 'index'" do

    before(:each) do
      @user = sign_in

      @samples = [
        {"tsh" => 4.5, "t3" => 2.2, "t4" => 5},
        {"tsh" => 5.5, "t3" => 1.5, "t4" => 3}
      ]

      @user.samples.stub(:all).and_return(@samples)
    end

    it "returns http success" do
      get :index
      response.should be_success
    end

    it "should return a list of all samples" do
      get 'index'
      assigns(:samples).should eq(@samples)
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = sign_in
      @sample = Factory.create(:sample, user: @user)
    end

    it "returns http success" do
      get :show, :id => @sample
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @user = sign_in
      @samples = FactoryGirl.create_list(:sample, 10, user: @user)
    end

    it "should destroy the sample" do
      lambda do
        delete :destroy, :id => @samples.first
      end.should change(@user.samples, :count).by(-1)
    end

    it "should redirect to the sample listing page" do
      delete :destroy, :id => @samples.first
      response.should redirect_to(samples_path)
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @user = sign_in
      @sample = FactoryGirl.create(:sample, user: @user, taken_on: "2012-03-15", tsh: 1.1, t3: 2.2, t4: 3.3)
      @attr = { taken_on: "2009-09-12", tsh: 6.3, t3: 3.2, t4: 2.7 }
    end

    context "success" do
      it "should update the sample's taken_on value" do
        date_format = "%Y-%M-%D"
        put :update, :id => @sample, :sample => @attr
        @sample.reload
        @sample.taken_on.to_formatted_s(date_format).should == @attr[:taken_on]
      end

      it "should update the sample's TSH value" do
        put :update, :id => @sample, :sample => @attr
        @sample.reload
        @sample.tsh.should == @attr[:tsh]
      end

      it "should update the sample's T3 value" do
        put :update, :id => @sample, :sample => @attr
        @sample.reload
        @sample.t3.should == @attr[:t3]
      end

      it "should update the sample's T4 value" do
        put :update, :id => @sample, :sample => @attr
        @sample.reload
        @sample.t4.should == @attr[:t4]
      end

      it "should redirect to the sample details page" do
        put :update, :id => @sample, :sample => @attr
        response.should redirect_to(sample_path(@sample))
      end
    end

    context "failure" do
      
      before(:each) do
        @user = sign_in
        @sample = FactoryGirl.create(:sample, user: @user)
        @attr = { taken_on: "", tsh: nil, t3: nil, t4: nil }
      end

      it "should render the edit page" do
        put :update, :id => @sample, :sample => @attr
        response.should render_template('edit')
      end
    end
  end
end
