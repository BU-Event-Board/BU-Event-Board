require 'rails_helper'





RSpec.describe SessionsController, type: :controller do

 


  describe "GET #debug" do
    it "returns http success" do
      get :debug
      expect(response).to have_http_status(:success)
    end
  end



  describe "GET #failure" do
    it "returns http success" do
      get :failure
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
   # app/controllers/sessions_controller_spec.rb


  describe "#create" do
    context "no active session, User and Authorization do not exist" do
      context 'register with github' do 
          before(:each) do
            session[:user_id] = nil
          end
          # Database has been cleaned, so shouldn't have to worry about User and Authorization
     
        describe 'When signing up for first time' do
          let(:auth) {double('Authorization', provider: "github", uid: "123456", user_id: id1, user: double('User', name: 'SUNY Tester', email: 'stester@binghamton.edu', id: id1))}
        #  end
          it "creates a User" do 
            p OmniAuth.config.mock_auth[:github][:info]
            expect { post :create, provider: :github }.to change(User, :count).by(1)
                       

          end        
          it "creates an Authorization" do
               expect { post :create, provider: :github }.to change(Authorization, :count).by(1)
          end
          it "creates a session" do 
                         
              post :create, provider: :github
              expect(session[:user_id]).to eq(1)
          end
          it "creates a current_user" do
              
              expect(controller).to receive(:current_user=).exactly(1).times 
              post :create, provider: :github
          end
        end
        describe 'After successful registration' do
          let(:id2)  {2}
          let(:user_id) {1} 
          let(:id1)  {1}
          let(:user) {double('User', name: 'SUNY Tester', email: 'stester@binghamton.edu', id: id1)}
          let(:auth) {double('Authorization', provider: "github", uid: "123456", user_id: id1, user: double('User', name: 'SUNY Tester', email: 'stester@binghamton.edu', id: id1))}             
          it "sets a flash message"  do
              post :create, provider: :github
              expect(flash[:notice]).to match(/^Welcome #{user.name}! You have signed up via #{auth.provider}.$/)
             
          end 
          it "creates an empty user profile" do
              post :create, provider: :github
              expect(assigns(:profile)).to have_attributes(id: id2, user_id: 1)
          end
          # Finally, we should test where it's going
          it "redirects to the edit profile page" do 
            post :create, provider: :github  
            expect(response).to redirect_to(edit_user_profile_path(user_id: 1, id: id2))
          end
        end
      end
    end
  end

  

end

# spec/controllers/sessions_controller_spec.rb

# ...


