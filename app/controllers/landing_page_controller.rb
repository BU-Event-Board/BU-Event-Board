class LandingPageController < ApplicationController
  skip_before_action :keep_out_unless_logged_in
  
  def index
     @action = 'login'
  end
    
  def about
     @action = 'login'
  end
end
