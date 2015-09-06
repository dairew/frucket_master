class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @buckets = Bucket.all
  end

  def show
  end

  def new
    @bucket = Bucket.new
  end

  def edit
  end

  def create
    @bucket = Bucket.new(bucket_params)

    respond_to do |format|
      if @bucket.save
        format.html { redirect_to @bucket, notice: 'Booyah! Your Bucket has been created.' }
        format.json { render :show, status: :created, location: @bucket }
      else
        format.html { render :new }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        redirect_to @bucket, notice: "Pin was successfully updated."
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your Bucket was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    def bucket_params
      params.require(:bucket).permit(:title, :description, :event_id)
    end
end
