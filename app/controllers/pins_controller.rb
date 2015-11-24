class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@search= Pin.search(params[:q])
		@pins = @search.result
		@pins = Pin.all.order("created_at DESC")
		if params[:tag]
			@pins = Pin.tagged_with(params[:tag])
		else
			@pins = Pin.all
		end

	end

	def show
		@cs = C.where(pin_id: @pin)
		@search= Pin.search(params[:q])
		@pins = @search.result
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin, notice: "Pin was successfully created"
		else
			render 'new'
		end


	end

	def edit
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin was successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end

	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :user_id, :tag_list)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

end