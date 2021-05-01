class Authorization < ActiveRecord::Base
  belongs_to :user
  def self.create_with_omniauth(auth, user) 
     user.authorizations.create!( provider: auth['provider'], uid: auth['uid'])
  end  
end
