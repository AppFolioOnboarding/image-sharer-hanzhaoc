class ImagesController < ApplicationController
  def new; end

  def create
    @image = Image.new(image_params)
    @image.save
    redirect_to @image
  end

  def show
    @image = Image.find(params[:id])
  end

  private 

    def image_params
      params.require(:image).permit(:title, :link)
    end
end
