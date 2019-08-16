class ImagesController < ApplicationController
  def new
    @image = Image.new
    # @images = Image.
    @show_image = Image.all.order(create_at: :desc)
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title, :link)
  end
end
