class UsersController < ApplicationController

   def index
       @users= User.page(params[:page]||1).per_page(params[:per_page]||4)
       .order('id desc')
   end

    def new
        @user = User.new
    end

    def create
        param = params.require(:user).permit(:user_name, :password)
        @user = User.create(param)
        unless @user.errors.empty?
             logger.error "@user.errors:#{@user.errors}"
            render   :new
        else
            redirect_to new_session_path
        end
    end


end