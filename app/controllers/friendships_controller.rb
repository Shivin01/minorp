class FriendshipsController < ApplicationController

def index
	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	if @friendship.save
	    flash[:notice] = "Added friend."
	    redirect_to root_url
	else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	end
end
def create
	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	if @friendship.save
	    flash[:notice] = "Added friend."
	    redirect_to root_url
	else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	end
end


end