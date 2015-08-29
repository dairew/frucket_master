class EventsController < ApplicationController
  before_action :set_bucket
  
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
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = @bucket.events.find(params[:id])
      if @event.destroy
          flash[:success] = "Event item was deleted."
      else
          flash[:error] = "Could not be completed."
      end
      redirect_to @bucket
  end

    private
    def set_bucket
    @bucket = Bucket.find(params[:bucket_id])
    end

    def event_params
      params[:event].permit(:content, :title, :location)
    end
end
