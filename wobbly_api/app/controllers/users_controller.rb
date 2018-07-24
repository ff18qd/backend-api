class UsersController < ApplicationController
  # https://www.codementor.io/omedale/simple-approach-to-rails-5-api-authentication-with-json-web-token-cpqbgrdo6

    def new
      @user = User.new(user_params)
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
    
    def show
      # binding.pry
      @user = User.find_by(id: params[:id])
      render json: @user
    end 
    
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :img_url)
    end

end