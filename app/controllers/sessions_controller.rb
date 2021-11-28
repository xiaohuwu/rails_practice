class SessionsController < ApplicationController

    def new
        logger.info "new ========>"
        @user = User.new
    end


    def create
        @user = User.find_by(user_name: params[:user][:user_name],
                             password: params[:user][:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "登录成功"
            redirect_to root_path
        else
            flash[:notice] = "用户名或密码失败"
            redirect_to   new_session_path
        end
    end



    def logout
        session[:user_id] = nil
        flash[:notice] = "退出成功"
        redirect_to root_path
    end


end
