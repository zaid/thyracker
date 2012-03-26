require 'spec_helper'

describe SessionsController do

  include SessionsHelper

  describe "POST 'create'" do

    context 'failure' do
      
      before(:each) do
        @attr = {
          email: 'joe@tester.ca',
          password: 'badpassword'
        }
      end

      it 'should not sign the user in' do
        post :create, email: @attr[:email], password: @attr[:password]
        controller.should_not be_signed_in
      end
    end

    context 'success' do

      before(:each) do
        @user = FactoryGirl.create(:user)

        @attr = {
          email: @user.email,
          password: @user.password
        }
      end

      it 'should sign the user in' do
        post :create, email: @attr[:email], password: @attr[:password]
        controller.should be_signed_in
      end

      it 'should redirect to the home page' do
        post :create, email: @attr[:email], password: @attr[:password]
        response.should redirect_to(root_path)
      end
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      user = FactoryGirl.create(:user)
 
      post :create, email: user.email, password: user.password
    end

    it 'should sign the user out' do
      delete :destroy
      controller.should_not be_signed_in
    end

    it 'should redirect to the home page' do
      delete :destroy
      response.should redirect_to(root_path)
    end
  end
end
