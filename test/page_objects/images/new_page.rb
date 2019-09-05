module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :f1, locator:'div.image_title' do
          element :title, locator:'#title'
        end
        element :f2, locator:'div.image_link' do
          element :link, locator: '#link'
          element :link_error_message, locator: '.invalid-feedback'
        end
        element :f3, locator:'div.image_tag_list' do
            element :tag_list, locator: '#tag_list'
        end
      end

        def create_image!(url: '', tags: nil)
          self.image.f1.title.set('something here')
          self.image.f2.link.set(url) if url.present?
          self.image.f3.tag_list.set(tags) if tags.present?
          node.click_on('Create Image')
          stale!
          window.change_to(ShowPage, NewPage)
      end
    end
  end
end
