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
end
