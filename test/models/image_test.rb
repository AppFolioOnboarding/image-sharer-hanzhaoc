require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image__valid
    image = Image.new(title: 'new image', link: 'dog.jpg')

    assert_predicate image, :valid?
  end

  def test_title__invalid_if_title_is_blank
    image = Image.new(title: '', link: 'something.jpg')

    refute_predicate image, :valid?
    assert_equal "can't be blank", image.errors.messages[:title].first
  end

  def test_link__invalid_if_link_is_not_image
    image = Image.new(title: 'new image', link: 'something.xxx')

    refute_predicate image, :valid?
  end
end
