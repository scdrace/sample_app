require 'test_helper'

# class StaticPagesControllerTest < ActionController::TestCase
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    #get :home
    get root_path
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    #get :help
    get help_path
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    #get static_pages_about_url
    #get :about
    get about_path
    assert_response :success
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end

  test "should get contact" do
    #get static_pages_contact_url
    #get :contact
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
