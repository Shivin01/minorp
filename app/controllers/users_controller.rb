class UsersController < ApplicationController
	# POST /users
  	# POST /users.json
  	def create
    	@user = User.new(params[:user])
 
    	#respond_to do |format|
      	if @user.save
        		# Tell the UserMailer to send a welcome email after save
        	UserMailer.welcome_email(@user).deliver
        	redirect_to @user, notice: "signed up successfully"
        else
        	render :new
 
	     
	    end
	 end
   def show
    @users = User.all.order("created_at DESC")
   end
   

end
