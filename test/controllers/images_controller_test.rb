require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'The landing page links to the image link submission form' do
    get images_path
    assert_response :success

    assert_select 'a[href]', 1
    assert_select 'a[href]' do |elements|
      assert_equal new_image_path, elements[0].attr(:href)
    end
  end

  test 'I can view an individual image' do
    image = Image.create! url: 'https://images.examples.com/one.jpg', created_at: Time.now

    get image_path image.id
    assert_response :success

    assert_select 'img[src]', 1
    assert_select 'img[src]' do |elements|
      assert_equal image.url, elements[0].attr(:src)
    end
  end

  test 'Newest images appear first' do
    Image.create! url: 'https://images.examples.com/four.jpg', created_at: Time.now
    Image.create! url: 'https://images.examples.com/three.jpg', created_at: Time.now - 1.day

    get images_path
    assert_response :success

    assert_select 'tr img[src]', 2
    assert_select 'tr img[src]' do |elements|
      assert_equal 'https://images.examples.com/four.jpg', elements[0].attr(:src)
      assert_equal 'https://images.examples.com/three.jpg', elements[1].attr(:src)
    end
  end

  test 'images are persisted if the browser is closed or even if the server is restarted' do
    assert_difference 'Image.count' do
      post images_path,
           params: { image: { url: 'https://images.examples.com/three.jpg' } }
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    assert_equal 'https://images.examples.com/three.jpg', Image.last.url
  end
end
