require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  setup do
    @document = documents(:one)
  end

  test "visiting the index" do
    visit documents_url
    assert_selector "h1", text: "Documents"
  end

  test "should create document" do
    visit documents_url
    click_on "New document"

    fill_in "Auteur", with: @document.auteur
    fill_in "Isbn", with: @document.isbn
    fill_in "Titre", with: @document.titre
    fill_in "Type", with: @document.type
    click_on "Create Document"

    assert_text "Document was successfully created"
    click_on "Back"
  end

  test "should update Document" do
    visit document_url(@document)
    click_on "Edit this document", match: :first

    fill_in "Auteur", with: @document.auteur
    fill_in "Isbn", with: @document.isbn
    fill_in "Titre", with: @document.titre
    fill_in "Type", with: @document.type
    click_on "Update Document"

    assert_text "Document was successfully updated"
    click_on "Back"
  end

  test "should destroy Document" do
    visit document_url(@document)
    click_on "Destroy this document", match: :first

    assert_text "Document was successfully destroyed"
  end
end
