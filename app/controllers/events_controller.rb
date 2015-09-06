class EventsController < ApplicationController
  before_action :set_bucket
  before_action :set_event, except: [:create]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = @bucket.events.create(event_params)
    redirect_to @bucket
  end 

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(bucket_params)
        redirect_to @event, notice: "Pin was successfully updated."
      else
        render action: "edit"
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
      if @event.destroy
          flash[:success] = "Event item was deleted."
      else
          flash[:error] = "Could not be completed."
      end
      redirect_to @bucket
  end

  def complete
    @event.toggle_completion
    redirect_to @bucket, notice: "Congrats! You completed an event."
  end

    private
    def set_bucket
      @bucket = Bucket.find(params[:bucket_id])
    end

    def set_event
      @event = @bucket.events.find(params[:id])
    end

    def event_params
      params[:event].permit(:content, :title, :location)
    end
end
