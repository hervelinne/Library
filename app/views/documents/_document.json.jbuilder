json.extract! document, :id, :type, :titre, :auteur, :isbn, :created_at, :updated_at
json.url document_url(document, format: :json)
