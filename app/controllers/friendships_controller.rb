class FriendshipsController < ApplicationController
	before_filter :authenticate_user!, only: [:user_listing, :friend_list]
	def send_friend_request
		@friendship = current_user.friendships.create(:friend_id => params[:friend_id])
	  	if @friendship.save
	    	flash[:notice] = "Added friend."
	  	else
	    	flash[:error] = "Unable to add friend."
  		end	
  		  redirect_to :back and return
   	end

   	def friend_list
   	  @friends = current_user.friends
   	end

   	private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:user_id, :friend_id)
    end
end
