class UsersController < ApplicationController
    
    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
        end 
    end

    def show 
        set_user
        redirect_to '/' if !@user 
    end

    def edit 
        set_user
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end
    
    private 

        def set_user
            @user = User.find_by(id: params[:id])
        end

        def user_params 
            params.require(:user).permit(:username, :password)
        end 
end