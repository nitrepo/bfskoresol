class UsersController < ApplicationController
  
skip_before_filter :require_login, :only => [:new, :create, :activate]

def new
    @data = params[:email_subscribe] 
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to main_app.userlogin_path, :notice => "Registration successful. Check your email for activation instructions."
    else
      render :new
    end
  end
  
  def activate
  if (@user = User.load_from_activation_token(params[:id]))
    @user.activate!
    redirect_to(main_app.userlogin_path, :notice => 'User was successfully activated.')
  else
    not_authenticated
  end
end

  

end
