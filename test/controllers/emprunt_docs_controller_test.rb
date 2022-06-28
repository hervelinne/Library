require "test_helper"

class EmpruntDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emprunt_doc = emprunt_docs(:one)
  end

  test "should get index" do
    get emprunt_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_emprunt_doc_url
    assert_response :success
  end

  test "should create emprunt_doc" do
    assert_difference("EmpruntDoc.count") do
      post emprunt_docs_url, params: { emprunt_doc: { id_adh: @emprunt_doc.id_adh, isbn_livre: @emprunt_doc.isbn_livre } }
    end

    assert_redirected_to emprunt_doc_url(EmpruntDoc.last)
  end

  test "should show emprunt_doc" do
    get emprunt_doc_url(@emprunt_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_emprunt_doc_url(@emprunt_doc)
    assert_response :success
  end

  test "should update emprunt_doc" do
    patch emprunt_doc_url(@emprunt_doc), params: { emprunt_doc: { id_adh: @emprunt_doc.id_adh, isbn_livre: @emprunt_doc.isbn_livre } }
    assert_redirected_to emprunt_doc_url(@emprunt_doc)
  end

  test "should destroy emprunt_doc" do
    assert_difference("EmpruntDoc.count", -1) do
      delete emprunt_doc_url(@emprunt_doc)
    end

    assert_redirected_to emprunt_docs_url
  end
end
