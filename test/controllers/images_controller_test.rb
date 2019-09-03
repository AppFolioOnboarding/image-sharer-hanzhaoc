require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'new' do
    get new_image_path
    assert_response :ok
  end

  test 'create success' do
    assert_difference('Image.count', 1) do
      params = { title: 'A dog', link: 'dog.jpg' }
      post images_path, params: { image: params }
    end
    assert_redirected_to image_path(Image.last)
  end

  test 'create fail no title' do
    assert_difference('Image.count', 0) do
      params = { title: '', link: 'dog.jpg' }
      post images_path, params: { image: params }
    end
  end

  test 'create fail no link' do
    assert_difference('Image.count', 0) do
      params = { title: 'A dog', link: '' }
      post images_path, params: { image: params }
    end
  end

  test 'create fail invalid link' do
    assert_difference('Image.count', 0) do
      params = { title: 'A dog', link: 'xx.jp' }
      post images_path, params: { image: params }
    end
  end

  test 'create with tag success' do
    assert_difference('Image.count', 1) do
      params = { title: 'A dog', link: 'xxx.jpg', tag_list: 'tag1' }
      post images_path, params: { image: params }
    end
  end

  test 'create with multiple tag success' do
    assert_difference('Image.count', 1) do
      params = { title: 'A dog', link: 'xxx.jpg', tag_list: 'tag1, tag2' }
      post images_path, params: { image: params }
    end
  end

  test 'create with tag show tag in show' do
    params = { title: 'A dog', link: 'xxx.jpg', tag_list: 'tag1' }
    post images_path, params: { image: params }
    assert_equal %w[tag1 all], Image.last.tag_list
  end

  test 'create with 2 tag show 2 tag in show' do
    params = { title: 'A dog', link: 'xxx.jpg', tag_list: 'tag1, tag2' }
    post images_path, params: { image: params }
    assert_equal %w[tag1 tag2 all], Image.last.tag_list
  end
end
