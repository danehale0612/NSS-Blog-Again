require 'test_helper'

class AnonymousPostsAricleTest < ActionDispatch::IntegrationTest
  test "posting a new article" do
    visit '/'
    click_link 'Write Post'
    fill_in 'Title', with: 'My First Post!!'
    fill_in 'Body', with: "I don't have anything to say"
    assert_include page.body, "Your post has now been published!"
    visit '/posts'
    assert_include page.body 'My First Post!!'
  end
end