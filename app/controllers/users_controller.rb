class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
  	
    # return user defined by URL if it exists, otherwise get from session
    @user = User.find_by_username(params[:id])||current_user 
    #binding.pry
    @nuggets = @user.nuggets

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

end
