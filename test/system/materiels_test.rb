require "application_system_test_case"

class MaterielsTest < ApplicationSystemTestCase
  setup do
    @materiel = materiels(:one)
  end

  test "visiting the index" do
    visit materiels_url
    assert_selector "h1", text: "Materiels"
  end

  test "should create materiel" do
    visit materiels_url
    click_on "New materiel"

    fill_in "Marque", with: @materiel.marque
    fill_in "Material", with: @materiel.material_id
    fill_in "Os", with: @materiel.os
    click_on "Create Materiel"

    assert_text "Materiel was successfully created"
    click_on "Back"
  end

  test "should update Materiel" do
    visit materiel_url(@materiel)
    click_on "Edit this materiel", match: :first

    fill_in "Marque", with: @materiel.marque
    fill_in "Material", with: @materiel.material_id
    fill_in "Os", with: @materiel.os
    click_on "Update Materiel"

    assert_text "Materiel was successfully updated"
    click_on "Back"
  end

  test "should destroy Materiel" do
    visit materiel_url(@materiel)
    click_on "Destroy this materiel", match: :first

    assert_text "Materiel was successfully destroyed"
  end
end
