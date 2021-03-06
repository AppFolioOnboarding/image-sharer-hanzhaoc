class ImagesController < ApplicationController
  def index
    tag_names = list_tag_names
    tag = params[:tag]
    @images = list_images_with_tag(tag, tag_names)
    flash.now.alert = 'Tag not exist - list all images' unless tag_names.include?(tag)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.tag_list.add('all') unless @image.tag_list.include?('all')
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
    params.require(:image).permit(:title, :link, :tag_list)
  end

  def list_tag_names
    ActsAsTaggableOn::Tag.all.map(&:name)
  end

  def list_images_with_tag(tag, tag_names)
    if tag.nil? || !tag_names.include?(tag)
      Image.all.order(created_at: :desc)
    else
      Image.tagged_with(tag).order(created_at: :desc)
    end
  end
end
