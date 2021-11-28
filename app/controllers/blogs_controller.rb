class BlogsController < ApplicationController


    before_action :auth_user, except: [:index, :show]

    def index
        @blogs = Blog.page(params[:page] || 1).per_page(params[:per_page] || 10).order(id: :desc)
    end

    def new

        @blog = current_user.blogs.new
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def create
        blog = current_user.blogs.create(params[:blog].permit!)
        if blog.save
            blog.update_tags(params[:tags])
            logger.info "创建成功"
            redirect_to blogs_path
        else
            logger.info "创建失败"
            render :new
        end
    end

    def update
        @blog = Blog.find(params[:id])
        if  @blog.update(params[:blog].permit!)
            @blog.tags.destroy_all
            @blog.update_tags(params[:tags])
            logger.info "更新成功"
            redirect_to blogs_path
        else
            logger.info "更新失败#{@blog.errors.messages}"
            render :edit
        end
    end


end
