class CsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@pin = Pin.find(params[:pin_id])
		@c = C.create(params[:c].permit(:content))
		@c.user_id =  current_user.id
		@c.pin_id = @pin.id

		if @c.save
			redirect_to pin_path(@pin)
		else
			render 'new'
		end
	end
end

