require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET#new" do
    it "displays the signup page" do

      get :new
      expect(response).to render_template(:new)
    end 
  end

  describe "POST#create" do
    context 'with_valid_params' do 
      it "logs in the user" do
        post :create, params: {user: {username: 'harry slaughter', password: "password"}}
        
        user = User.find_by(username: 'harry slaughter')
        expect(response).to redirect_to(user_url(user))
      end
      
      it "redirects to user's homepage" do
        post :create, params: {user: {username: 'harry slaughter', password: "password"}}
        
        user = User.find_by(username: 'harry slaughter')
        expect(response).to redirect_to(user_url(user))
      end
    end
  end
end