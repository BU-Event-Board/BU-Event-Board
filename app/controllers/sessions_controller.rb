class SessionsController < ApplicationController
    
  def clear
    session.clear
    #redirect_to welcome_to_landing_path
  end


  def debug
    auth_hash = request.env['omniauth.auth']
    puts '\n raw auth_hash\n'
    p auth_hash
    puts '\n\nauth_hash by key\n'
    auth_hash.each_pair do |key, value|
      puts "\nKEY: #{key}"
      if value.kind_of?(Hash)
        nested_hash(value, '')
      else
        puts "Value: #{value}"
      end
        unless auth_hash.info.email.include? "binghamton.edu"
          redirect_to failure
       end
    end
  end
  

    
  def new
  end

  def nested_hash nh, indent
    puts indent + "VALUE is a nested hash"
    indent += '  '
    nh.each_pair do |key, value|
      puts indent + "KEY: #{key}"
      if value.kind_of?(Hash)
        nested_hash(value, indent)
      else
        puts indent + "VALUE:  #{value}"
      end     
    end
  end
    
  def create
    #debug 
    #user = User.create!("name" => auth_hash[:info][:name], "email" => auth_hash[:info][:email])
    begin 
    @user = User.create_with_omniauth(auth_hash['info']) 
    auth = Authorization.create_with_omniauth(auth_hash, @user)
    p auth
    self.current_user= auth.user
    @profile = @user.create_profile
    session[:user_id] = auth.user.id
    message = "Welcome #{@user.name}! You have signed up via #{auth.provider}."
    flash[:notice] = message
    redirect_to edit_user_profile_path(@user,@profile)  
    rescue ActiveRecord::RecordInvalid,  Exception => exception
        flash[:warning] = "#{exception.class}: #{exception.message}"
       #redirect_to welcome_to_landing_path and
        return 
     end
  end

  def auth_hash
      #ensures that it's only retrieved once per cycle
      @auth_hash ||= request.env['omniauth.auth'] 
  end
  def failure
      
  end

  def destroy
  end
end
