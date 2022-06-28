json.extract! emprunt_doc, :id, :isbn_livre, :id_adh, :created_at, :updated_at
json.url emprunt_doc_url(emprunt_doc, format: :json)
