require 'flow_test_helper'

class ImagesCrudTest < FlowTestCase
  test 'add an image' do
    images_index_page = PageObjects::Images::IndexPage.visit

    new_image_page = images_index_page.add_new_image!

    tags = %w[foo bar]
    new_image_page = new_image_page.create_image!(
      url: 'invalid',
      tags: tags.join(', ')
    ).as_a(PageObjects::Images::NewPage)
    assert_equal 'Link Only allows image format.', new_image_page.image.f2.link_error_message.text

    image_url = 'https://media3.giphy.com/media/EldfH1VJdbrwY/200.gif'
    new_image_page.image.f2.link.set(image_url)
    new_image_page.image.f3.tag_list.set('foo, bar')
    image_show_page = new_image_page.create_image!
    assert_equal 'You have successfully added an image.', image_show_page.alert.text

    assert_equal image_url, image_show_page.image_url
    assert_equal tags.concat(['all']), image_show_page.tags

    images_index_page = image_show_page.go_back_to_index!
    assert images_index_page.showing_image?(url: image_url, tags: tags)
  end

  test 'delete an image' do
    cute_puppy_url = 'http://ghk.h-cdn.co/assets/16/09/980x490/landscape-1457107485-gettyimages-512366437.jpg'
    ugly_cat_url = 'http://www.ugly-cat.com/ugly-cats/uglycat041.jpg'
    Image.create!([
      { title: 'test1', link: cute_puppy_url, tag_list: 'puppy, cute' },
      { title: 'test2', link: ugly_cat_url, tag_list: 'cat, ugly' }
    ])

    images_index_page = PageObjects::Images::IndexPage.visit
    assert_equal 2, images_index_page.images.count
    assert_not images_index_page.showing_image?(url: ugly_cat_url)
    assert images_index_page.showing_image?(url: cute_puppy_url, tags: %w[puppy cute])

    image_to_delete = images_index_page.images.find do |image|
      image.url == ugly_cat_url
    end
    image_show_page = image_to_delete.view!

    image_show_page.delete do |confirm_dialog|
      assert_equal 'Are you sure to delete this image?', confirm_dialog.text
      confirm_dialog.dismiss
    end

    images_index_page = image_show_page.delete_and_confirm!
    assert_equal 'You have successfully deleted the image.', images_index_page.alert.text

    assert_equal 1, images_index_page.images.count
    assert_not images_index_page.showing_image?(url: ugly_cat_url)
    assert images_index_page.showing_image?(url: cute_puppy_url, tags: %w[puppy cute])
  end

  test 'view images associated with a tag' do
    puppy_url1 = 'http://www.pawderosa.com/images/puppies.jpg'
    puppy_url2 = 'http://ghk.h-cdn.co/assets/16/09/980x490/landscape-1457107485-gettyimages-512366437.jpg'
    cat_url = 'http://www.ugly-cat.com/ugly-cats/uglycat041.jpg'

    images = [
      { title: 'title1', link: puppy_url1, tag_list: 'superman, cute, all' },
      { title: 'title2', link: puppy_url2, tag_list: 'cute, puppy, all' },
      { title: 'title3', link: cat_url, tag_list: 'cat, ugly, all' }
    ]
    Image.create!(images)

    images_index_page = PageObjects::Images::IndexPage.visit
    images.each do |image|
      assert images_index_page.showing_image?(url: image[:link], tags: image[:tag_list].split(', '))
    end

    images_index_page = images_index_page.images[1].click_tag!('cute')

    assert_equal 2, images_index_page.images.count
    assert_not images_index_page.showing_image?(url: cat_url)
    images_index_page = images_index_page.clear_tag_filter!
    assert_equal 3, images_index_page.images.count
  end
end
