module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      element :alert, locator: '.alert-primary'
      element :title, locator: '#title'
      element :link, locator: '#link'
      collection :show_tags, locator:'.tags' do
      end
      element :back_button, locator: '#index'
      element :delete_button, locator: '#delete'

      def image_url
        node.find('img')[:src]
      end

      def tags
        self.show_tags.map do |t|
          t.text
        end
      end

      def delete
        self.delete_button.node.click
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        self.delete_button.node.click
        alert = node.driver.browser.switch_to.alert
        alert.accept
        stale!
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        back_button.node.click
        stale!
        window.change_to(IndexPage)
      end
    end
  end
end
