require 'test_helper'

class AnonymousUserPostAricleTest < ActionDispatch::IntegrationTest
  test "view list of aricles" do
    Post.create!(title: "First Post!!", body: "This is awkward... I have nothing to say :(")
    Post.create!(title: "Wow, it's been a while!", body: "And yet, I'm still not a writer")

    visit '/posts'
    assert_equal 2, Post.count
    assert_include page.body, "All Posts"
    assert_include page.body, "First Post!!"
    assert_include page.body, "Wow, it's been a while!"
  end
end