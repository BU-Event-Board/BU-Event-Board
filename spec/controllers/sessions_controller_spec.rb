require 'rails_helper'





RSpec.describe SessionsController, type: :controller do


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
            post :create, provider: :github
            
                       

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
          it 'checks to see that a previous authorization does not exist' do
               expect(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github] ).and_return(false)
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
      
    context "no active session, User and Authorization already exist" do
      context "Login with github" do
        before(:each) do
          session[:user_id] = nil  
          @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
          @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
        end 
        describe 'When logging in a registered user' do
          let(:id1)  {1}
          let(:user_id1) {1}
          let(:auth1) {@auth}
          let(:user1) {@user}
          it "checks to see if a previous authorization exists" do
              expect(Authorization).to receive(:exists?).with(OmniAuth.config.mock_auth[:github] ).and_return(true)
              post :create, provider: :github
          end
          it 'recovers the previous authorization' do
              expect(user1).to have_attributes(name: 'SUNY Tester', email: 'stester@binghamton.edu', id: user1.id)
              post :create, provider: :github
          end
          it 'recovers the previous user' do
              post :create, provider: :github
          end
          it 'sets the session' do
              post :create, provider: :github
              expect(session[:user_id]).to eq(user1.id)
          end
          it 'sets the current user' do
              post :create, provider: :github
              expect(flash[:notice]).to match(/^Welcome back #{user1.name}! You have logged in via #{auth1.provider}.$/)  
          end
          it 'sets a flash message' do
              expect(controller).to receive(:current_user=).exactly(1).times     
              post :create, provider: :github
          end
          it 'redirects to the home page' do
              post :create, provider: :github
              expect(response).to redirect_to(events_path) 
          end
        end
      end
    end 
      
      
  end
end

# spec/controllers/sessions_controller_spec.rb

# ...


