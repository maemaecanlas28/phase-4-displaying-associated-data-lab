class UsersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    # include is plural because user HAS MANY items
    def show
        user = User.find_by(id: params[:id])
        render json: user, include: :items
    end

    private 

    def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
    end
end
