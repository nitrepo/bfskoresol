class SessionsController < ApplicationController
  
  def new
    end

     def create
      respond_to do |format|
        if @user = login(params[:email],params[:password],params[:remember])
          #format.html { redirect_back_or_to(refinery.root_path, :notice => 'Login successful.') }
          format.html { redirect_back_or_to(refinery.root_path) }
          format.xml { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { flash.now[:alert] = "Login failed."; render :action => "new" }
          format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
    

  def destroy
  #  forget_me!
    logout
    #redirect_to refinery.root_path, :notice => "Logged out!"
    redirect_to refinery.root_path
  end

end
