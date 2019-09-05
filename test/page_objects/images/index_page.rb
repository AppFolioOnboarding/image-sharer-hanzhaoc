module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      element :alert, locator: '.alert-primary'
      collection :images, locator: '.gallery', item_locator: '.gallery__card', contains: ImageCard do
        def view!
          node.click_on('Show')
          stale!
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.click_on('Upload')
        window.change_to(NewPage)
      end

      def showing_image?(url: '', tags: nil)
        tags.present?
        images.each do |image|
          return true if image.url == url && image.tags == tags
        end
        false
      end

      def clear_tag_filter!
        node.find('#tags').click_link('all')
        window.change_to(IndexPage)
      end
    end
  end
end
