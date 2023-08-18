class Api::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def create
        build_resource(sign_up_params)
        if resource.save
          render json: resource
        else
          render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
  
    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
    
  end
  