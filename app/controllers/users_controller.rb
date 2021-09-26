class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create, :edit, :update]
    before_action :set_param, only: [:show, :edit, :update, :destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to sessions_new_path, notice: "Your account has succesfully been created!"
        else
            render :new
        end
    end

    def show
        
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(current_user.id), notice: "Profile updated!"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
    end

    def set_param
        @user = User.find(params[:id])
    end
end
