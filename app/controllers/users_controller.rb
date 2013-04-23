class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
  	#binding.pry
    @user = current_user #User.find_by_username(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

end
