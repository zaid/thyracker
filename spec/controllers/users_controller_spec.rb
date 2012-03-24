require 'spec_helper'

describe UsersController do

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
          first_name: 'Joe',
          last_name: 'Tester',
          email: 'joe@tester.ca',
          password: 'secret',
          password_confirmation: 'secret'
        }
      end

      it "should create a new user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :user => @attr
        response.should redirect_to(root_path)
      end
    end

    context "failure" do

      before(:each) do
        @attr = {
          first_name: '',
          last_name: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
      end

      it "should not create a new user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should render the sign-up form" do
        post :create, :user => @attr
        response.should render_template('pages/home')
      end
    end
  end
end
