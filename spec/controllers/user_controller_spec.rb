require 'rails_helper'

RSpec.describe "UserController" do
  describe "GET#new" do
    it "displays the signup page" do
      get :new
      expect (response).to render_template(:new)
    end 
  end

  describe "POST#create" do
    context 'with_valid_params' do 
      # before
      it "logs in the user" do
        POST :create, params: {user: {username: 'harry slaughter', password: "password"}}
        
        user = User.find_by(username: 'harry slaughter')
        expect(session[:session_token]).to eq(user.session_token)
      end
      
      it "redirects to user's homepage" do
        POST :create, params: {user: {username: 'harry slaughter', password: "password"}}
        
        user = User.find_by(username: 'harry slaughter')
        expect (response).to redirect_to(user_url(user))
      end


    end
  end




  
end