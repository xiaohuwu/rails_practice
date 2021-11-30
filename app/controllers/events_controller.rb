class EventsController < ApplicationController
    def index

        sort_by = (params[:order] == 'name') ? 'name' : 'created_at'
        if params[:keyword]
            @events = Event.where("name like ?","%#{params[:keyword]}%").order(sort_by)
            @events = Event.all.order(sort_by)
        end
        respond_to do |format|
            format.html # index.html.erb
            format.xml { render :xml => @events.as_json }
            format.json { render :json => @events.to_json }
            format.atom { @feed_title = "My event list" } # index.atom.builder
        end
=begin
        byebug
=end

    end

    def new
        @event = Event.new
        @groups = Group.all
    end

    def edit
        @event = Event.find params[:id]
        @groups = Group.all
    end

    def create
       if  Event.create(params[:event].permit!)
           redirect_to :action => :index
       else
           render :new
       end
    end

    def update
        @events = Event.find params[:id]
        @events.update(params[:event].permit!)
        redirect_to :action => :index
    end

    def show
        @event = Event.find(params[:id])
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to :action => :index
    end

    def bulk_update
        Event.where(id: params[:ids]).update_all(status:'published') if params[:commit] == 'Publish'
        Event.where(id: params[:ids]).destroy_all if params[:commit] == 'Delete'
        redirect_to :action => :index
    end

    def join
        Membership.find_or_create_by(event_id: params[:event_id], current_user: current_user)
    end


end
