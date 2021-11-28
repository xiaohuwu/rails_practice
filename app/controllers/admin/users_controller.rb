class Admin::UsersController < ApplicationController
    layout 'admin'

    def index
        @users= User.page(params[:page]||1).per_page(params[:per_page]||4)
                    .order('id desc')
    end

    def search
        @users= User.page(params[:page]||1).per_page(params[:per_page]||4)
                    .order('id desc').where("user_name like ?", "%#{params[:user_name]}%")
        render :index
    end
end
