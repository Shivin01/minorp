class Search < ActiveRecord::Base
	def pins
		@pins ||= find_pins
	end

private
	def find_pins
		pins= Pin.order(:title)
		pins= pins.where("name like?" , "%#{keywords}% ") if keywords.present?
		pins
	end
end
