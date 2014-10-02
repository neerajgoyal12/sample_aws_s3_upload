class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  after_action :aws_presigned_url, only: [:create]
  # before_action :aws_presigned_url, only: [:]
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image_url, :image)
    end
    
    def aws_presigned_url
      credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],
                                                ENV['AWS_SECRET_ACCESS_KEY'])
      puts credentials.to_yaml
      @client = Aws::S3::Client.new(credentials: credentials, region: "ap-southeast-1")
      puts @client.config.endpoint
      response = @client.put_object(acl: "private",
                         bucket: "#{ENV['AWS_BUCKET']}",
                         key: "photos/#{@photo.id}/large/#{SecureRandom.hex}")
      puts response.data
      # @url = @signer.presigned_url(:get_object, bucket: "#{Rails.configuration.aws['AWS_BUCKET']}", key: "")
      # puts @url
      # puts @url.key
    end
end
