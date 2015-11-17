require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, wine: { bottleSize: @wine.bottleSize, company: @wine.company, country: @wine.country, grape: @wine.grape, image_url: @wine.image_url, longDescription: @wine.longDescription, price: @wine.price, shortDescription: @wine.shortDescription, title: @wine.title, vegetarians: @wine.vegetarians }
    end

    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should show wine" do
    get :show, id: @wine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wine
    assert_response :success
  end

  test "should update wine" do
    patch :update, id: @wine, wine: { bottleSize: @wine.bottleSize, company: @wine.company, country: @wine.country, grape: @wine.grape, image_url: @wine.image_url, longDescription: @wine.longDescription, price: @wine.price, shortDescription: @wine.shortDescription, title: @wine.title, vegetarians: @wine.vegetarians }
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, id: @wine
    end
   
    assert_redirected_to 'http://test.host/wines?page=1'
   # assert_redirected_to wines_path
  end
end
