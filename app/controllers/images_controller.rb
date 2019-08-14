class ImagesController < ApplicationController
  def new; end

  def create
    @image = Image.new(image_params)
    if !check_if_image(@image[:link])
      flash[:notice] = 'Post does not contain a image url'
      render 'new'
    else
      flash[:notice] = 'Post successfully created'
      @image.save
      redirect_to @image
    end
  end

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title, :link)
  end

  def check_if_image(link)
    tokens = link.split('.')
    return false unless tokens.last

    return false unless %w[jpeg jpg gif png].include? tokens.last

    true
  end
end
