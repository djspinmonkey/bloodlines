require 'test_helper'

class TraitsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:traits)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_trait
    assert_difference('Trait.count') do
      post :create, :trait => { }
    end

    assert_redirected_to trait_path(assigns(:trait))
  end

  def test_should_show_trait
    get :show, :id => traits(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => traits(:one).id
    assert_response :success
  end

  def test_should_update_trait
    put :update, :id => traits(:one).id, :trait => { }
    assert_redirected_to trait_path(assigns(:trait))
  end

  def test_should_destroy_trait
    assert_difference('Trait.count', -1) do
      delete :destroy, :id => traits(:one).id
    end

    assert_redirected_to traits_path
  end
end
