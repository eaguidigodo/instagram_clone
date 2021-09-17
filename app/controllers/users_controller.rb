class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create, :edit, :update]
    def new
        @user = User.new
    end

    def create
        @user = User.new(set_params)
        if @user.save
            redirect_to sessions_new_path, notice: "Your account has succesfully been created!"
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
        if @user.update(set_param)
            redirect_to user_path(current_user.id), notice: "Profile updated!"
        else
            render :new
        end
    end

    private
    def set_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
