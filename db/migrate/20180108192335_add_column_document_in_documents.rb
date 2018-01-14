class AddColumnDocumentInDocuments < ActiveRecord::Migration[5.0]
  def change
    add_attachment :documents, :documents
  end
end
