require "application_system_test_case"

class EmpruntMaterielsTest < ApplicationSystemTestCase
  setup do
    @emprunt_materiel = emprunt_materiels(:one)
  end

  test "visiting the index" do
    visit emprunt_materiels_url
    assert_selector "h1", text: "Emprunt materiels"
  end

  test "should create emprunt materiel" do
    visit emprunt_materiels_url
    click_on "New emprunt materiel"

    fill_in "Id adh", with: @emprunt_materiel.id_adh
    fill_in "Id mat", with: @emprunt_materiel.id_mat
    click_on "Create Emprunt materiel"

    assert_text "Emprunt materiel was successfully created"
    click_on "Back"
  end

  test "should update Emprunt materiel" do
    visit emprunt_materiel_url(@emprunt_materiel)
    click_on "Edit this emprunt materiel", match: :first

    fill_in "Id adh", with: @emprunt_materiel.id_adh
    fill_in "Id mat", with: @emprunt_materiel.id_mat
    click_on "Update Emprunt materiel"

    assert_text "Emprunt materiel was successfully updated"
    click_on "Back"
  end

  test "should destroy Emprunt materiel" do
    visit emprunt_materiel_url(@emprunt_materiel)
    click_on "Destroy this emprunt materiel", match: :first

    assert_text "Emprunt materiel was successfully destroyed"
  end
end
