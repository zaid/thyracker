require 'spec_helper'

describe SamplesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    context "success" do

      before(:each) do
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
        end.should change(Sample, :count).by(1)
      end

      it "should redirect to the sample 'show' page" do
        post :create, :sample => @attr
        response.should redirect_to(sample_path(assigns(:sample)))
      end
    end

    context "failure" do

      before(:each) do
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
        end.should_not change(Sample, :count)
      end

      it "should render the 'new' template" do
        post :create, :sample => @attr
        response.should render_template('new')
      end
    end
  end

  describe "GET 'index'" do

    before(:each) do
      @samples = [
        {"tsh" => 4.5, "t3" => 2.2, "t4" => 5},
        {"tsh" => 5.5, "t3" => 1.5, "t4" => 3}
      ]

      Sample.stub(:all).and_return(@samples)
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
      @sample = Factory.create(:sample)
    end

    it "returns http success" do
      get 'show', :id => @sample._id
      response.should be_success
    end
  end
end
