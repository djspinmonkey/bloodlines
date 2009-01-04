require 'test_helper'

class CharacterRacesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:character_races)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_character_race
    assert_difference('CharacterRace.count') do
      post :create, :character_race => { }
    end

    assert_redirected_to character_race_path(assigns(:character_race))
  end

  def test_should_show_character_race
    get :show, :id => character_races(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => character_races(:one).id
    assert_response :success
  end

  def test_should_update_character_race
    put :update, :id => character_races(:one).id, :character_race => { }
    assert_redirected_to character_race_path(assigns(:character_race))
  end

  def test_should_destroy_character_race
    assert_difference('CharacterRace.count', -1) do
      delete :destroy, :id => character_races(:one).id
    end

    assert_redirected_to character_races_path
  end
end
