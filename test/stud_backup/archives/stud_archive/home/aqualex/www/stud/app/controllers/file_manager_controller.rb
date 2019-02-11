class FileManagerController < ApplicationController
  layout 'file_manager'
  before_action :login_required

  def index
    @@tag_name = params[:tag_name]
    @tag = @@tag_name
    @photos = current_user.images
  end

  def new
    @photo = current_user.images.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.images.new(photo_params)
    @photo.save!
    @photos = @user.images
    render :index
  end



  private

  def photo_params
    params.require(:image).permit(:picture)
  end
end
