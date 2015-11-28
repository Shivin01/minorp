class UsersController < ApplicationController

  # POST /users
  	# POST /users.json
  	def create
    	@user = User.new(params[:user])
	 end
   def show
    @users = User.all.order("created_at DESC")

   end
   
  def find_user
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
  end
end
 def profile
    @pins = current_user.pins
    
 end
 def show1
    
    @cs = C.where(pin_id: @pin)
    @search= Pin.search(params[:q])
    @pins = @search.result
  end


end
