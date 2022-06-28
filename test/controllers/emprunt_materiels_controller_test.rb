require "test_helper"

class EmpruntMaterielsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emprunt_materiel = emprunt_materiels(:one)
  end

  test "should get index" do
    get emprunt_materiels_url
    assert_response :success
  end

  test "should get new" do
    get new_emprunt_materiel_url
    assert_response :success
  end

  test "should create emprunt_materiel" do
    assert_difference("EmpruntMateriel.count") do
      post emprunt_materiels_url, params: { emprunt_materiel: { id_adh: @emprunt_materiel.id_adh, id_mat: @emprunt_materiel.id_mat } }
    end

    assert_redirected_to emprunt_materiel_url(EmpruntMateriel.last)
  end

  test "should show emprunt_materiel" do
    get emprunt_materiel_url(@emprunt_materiel)
    assert_response :success
  end

  test "should get edit" do
    get edit_emprunt_materiel_url(@emprunt_materiel)
    assert_response :success
  end

  test "should update emprunt_materiel" do
    patch emprunt_materiel_url(@emprunt_materiel), params: { emprunt_materiel: { id_adh: @emprunt_materiel.id_adh, id_mat: @emprunt_materiel.id_mat } }
    assert_redirected_to emprunt_materiel_url(@emprunt_materiel)
  end

  test "should destroy emprunt_materiel" do
    assert_difference("EmpruntMateriel.count", -1) do
      delete emprunt_materiel_url(@emprunt_materiel)
    end

    assert_redirected_to emprunt_materiels_url
  end
end
