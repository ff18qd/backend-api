class UsersController < ApplicationController

    def new
    end
    
    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        # redirect_to '/'
        render json: user
      else
        # redirect_to '/signup'
        render json: {
          status: 500,
          errors: user.errors
        }.to_json
      end
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :img_url)
    end

end