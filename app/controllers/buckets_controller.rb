class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all
  end

  # GET /buckets/1
  # GET /buckets/1.json
  def show
  end

  # GET /buckets/new
  def new
    @bucket = Bucket.new
  end

  # GET /buckets/1/edit
  def edit
  end

  # POST /buckets
  # POST /buckets.json
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

  # PATCH/PUT /buckets/1
  # PATCH/PUT /buckets/1.json
  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        redirect_to @bucket, notice: "Pin was successfully updated."
      else
        render action: "edit"
      end
    end
  end

  # DELETE /buckets/1
  # DELETE /buckets/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your Bucket was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:title, :description, :event_id)
    end
end
