class EventsController < ApplicationController
  before_action :set_bucket
  before_action :set_event, except: [:create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = current_user.events
    @event = Event.new
  end

  def show
    @event = @bucket.events.find(params[:id])
    @whenoption = Whenoption.new(:event=>@event)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = @bucket.events.create(event_params)
    redirect_to @bucket
  end 

  def update
    respond_to do |format|
      if @event.update(bucket_params)
        redirect_to @event, notice: "Event was successfully updated."
      else
        render action: "edit"
      end
    end
  end

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

  # def upvote
  #   @bucket = Bucket.find(params[:bucket_id])
  #   @event = @bucket.events.find(params[:id])
  #   @event.upvote_by current_user
  #   redirect_to bucket_events_path(@bucket)
  # end

  private
  def set_bucket
    @bucket = Bucket.find(params[:bucket_id])
  end

  def set_event
    @event = @bucket.events.find(params[:id])
  end

  def event_params
    params[:event].permit(:content, :title, :location, :bucket_id)
  end
end