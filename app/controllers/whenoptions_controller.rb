class WhenoptionsController < ApplicationController
  before_action :set_bucket
  before_action :set_event
  before_action :set_whenoption, except: [:create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @whenoptions = current_user.whenoptions
    @whenoptions = Whenoption.new
  end

  def show
    @whenoption = @bucket.events.find(params[:id]).whenoptions
  end

  def new
    @whenoption = Whenoption.new
  end

  def edit
  end

  def create
    @event = @bucket.events.find(params[:event_id])
    @whenoption = @event.whenoptions.create(whenoption_params)
    redirect_to bucket_event_path(@bucket, @event)
  end

  def destroy
    @event = @bucket.events.find(params[:event_id])
      if @whenoption.destroy
          flash[:success] = "Option was deleted."
      else
          flash[:error] = "Could not be completed."
      end
      redirect_to bucket_event_path(@bucket, @event)  
  end

  private
    def set_bucket
      @bucket = Bucket.find(params[:bucket_id])
    end

    def set_event
      @event = @bucket.events.find(params[:event_id])
    end

    def set_whenoption
      @event = @bucket.events.find(params[:event_id])
      @whenoption = @event.whenoptions.create(params[:whenoption_id])    
    end

    def whenoption_params
      params.require(:whenoption).permit(:content)
    end

end
