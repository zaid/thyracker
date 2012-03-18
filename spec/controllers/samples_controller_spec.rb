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

  describe "DELETE 'destroy'" do

    before(:each) do
      @samples = FactoryGirl.create_list(:sample, 10)
    end

    it "should destroy the sample" do
      lambda do
        delete :destroy, :id => @samples.first._id
      end.should change(Sample, :count).by(-1)
    end

    it "should redirect to the sample listing page" do
      delete :destroy, :id => @samples.first._id
      response.should redirect_to(samples_path)
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @sample = FactoryGirl.create(:sample, taken_on: "2012-03-15", tsh: 1.1, t3: 2.2, t4: 3.3)
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
        @sample = FactoryGirl.create(:sample)
        @attr = { taken_on: "", tsh: nil, t3: nil, t4: nil }
      end

      it "should render the edit page" do
        put :update, :id => @sample, :sample => @attr
        response.should render_template('edit')
      end
    end
  end
end
