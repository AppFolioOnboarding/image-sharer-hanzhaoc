class ImagesController < ApplicationController

    def new 
    end


    def create
        # @image = Image.new(params.require(:image).permit(:title, :link))
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
            # last = tokens.last
            
            if !tokens.last
                return false
            elsif !['jpeg', 'jpg', 'gif', 'png'].include? tokens.last
                return false
            end
            return true
        end

end
