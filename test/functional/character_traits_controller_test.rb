require 'test_helper'

class CharacterTraitsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:character_traits)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_character_trait
    assert_difference('CharacterTrait.count') do
      post :create, :character_trait => { }
    end

    assert_redirected_to character_trait_path(assigns(:character_trait))
  end

  def test_should_show_character_trait
    get :show, :id => character_traits(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => character_traits(:one).id
    assert_response :success
  end

  def test_should_update_character_trait
    put :update, :id => character_traits(:one).id, :character_trait => { }
    assert_redirected_to character_trait_path(assigns(:character_trait))
  end

  def test_should_destroy_character_trait
    assert_difference('CharacterTrait.count', -1) do
      delete :destroy, :id => character_traits(:one).id
    end

    assert_redirected_to character_traits_path
  end
end
