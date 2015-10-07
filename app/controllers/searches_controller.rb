class SearchesController < ApplicationController
	def index
		if params[:search]
			@pins = Pin.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
		else
			@pins = Pin.find(:all)	
		end		
	end
end
