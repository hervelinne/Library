require "application_system_test_case"

class EmpruntDocsTest < ApplicationSystemTestCase
  setup do
    @emprunt_doc = emprunt_docs(:one)
  end

  test "visiting the index" do
    visit emprunt_docs_url
    assert_selector "h1", text: "Emprunt docs"
  end

  test "should create emprunt doc" do
    visit emprunt_docs_url
    click_on "New emprunt doc"

    fill_in "Id adh", with: @emprunt_doc.id_adh
    fill_in "Isbn livre", with: @emprunt_doc.isbn_livre
    click_on "Create Emprunt doc"

    assert_text "Emprunt doc was successfully created"
    click_on "Back"
  end

  test "should update Emprunt doc" do
    visit emprunt_doc_url(@emprunt_doc)
    click_on "Edit this emprunt doc", match: :first

    fill_in "Id adh", with: @emprunt_doc.id_adh
    fill_in "Isbn livre", with: @emprunt_doc.isbn_livre
    click_on "Update Emprunt doc"

    assert_text "Emprunt doc was successfully updated"
    click_on "Back"
  end

  test "should destroy Emprunt doc" do
    visit emprunt_doc_url(@emprunt_doc)
    click_on "Destroy this emprunt doc", match: :first

    assert_text "Emprunt doc was successfully destroyed"
  end
end
