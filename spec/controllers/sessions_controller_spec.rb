require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  describe "#create" do

    it 'creates a user from twitter data' do
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Alice Smith'},
        'uid' => 'abc123'
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'twitter')
      expect(user.name).to eq("Alice Smith")
    end

    it "doesn't create duplicate users" do 
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Bob Jones'},
        'uid' => 'xyz456'
      }

      User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')
      post :create
      expect(User.count).to eq(1)
    end   

    it 'logs in a new user' do 
      @request.env["omniauth.auth"] = {
      'provider' => 'twitter',
      'info' => {'name' => 'Alice Smith'},
      'uid' => 'abc123'
    }

    post :create 
    user = User.find_by_uid_and_provider('abc123', 'twitter')
    expect(controller.current_user.id).to eq(user.id)
    end

    it 'logs in an existing user' do 
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Bob Jones'},
        'uid' => 'xyz456'
      }
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')

      post :create 
      expect(User.count).to eq(1)
      expect(controller.current_user.id).to eq(user.id)
    end

    it 'redirects to the companies page' do 
      request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Charlie Allen'},
        'uid' => 'prq987'
      }

      user = User.create(provider: 'twitter', uid: 'prq987', name: 'Charlie Allen')
      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#destroy" do 
    before(:each) do
      Rails.application.routes.draw do
        root to: 'site#index'
        delete "/logout" => "sessions#destroy", as: :logout
        resource :sessions, :only => [:create, :destroy]
      end
      delete :destroy
      session[:user_id] = nil
    end

    it 'destroys session when logged out' do 
      expect(session[:user_id]).to eq(nil)
    end

    it 'redirects to home page' do 
      expect(response).to redirect_to(root_path)
    end
  end
end