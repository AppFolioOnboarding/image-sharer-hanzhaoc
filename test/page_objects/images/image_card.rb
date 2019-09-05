module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      collection :tag_list, locator: '.tags', item_locator: '.badge' do
        element :tag
      end
      def url
        node.find('img')[:src]
      end

      def tags
        res = []
        tag_list.each do |tag|
          res << tag.text
        end
        res
      end

      def click_tag!(tag_name)
        node.click_on(tag_name)
        stale!
        window.change_to(IndexPage)
      end
    end
  end
end
