require 'swagger_helper'

describe 'Upload Documents API' do

  path '/upload_documents' do

    post 'Creates a Document' do
      tags 'Document'
      consumes 'application/json'
      parameter name: :upload_documents, in: :body, schema: {
        type: :object,
          properties: { 
            documents: {
              documents_file_name: { type: :string },
              documents_content_type: { type: :string },
              name: { type: :string }
            }
          },
          required: ['documents_file_name', 'documents_content_type']
        }
      }

      response '201', 'contact created' do
        let(:upload_documents) { { documents_file_name: 'foo', documents_content_type: 'image/jpeg' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:upload_documents) { { documents_file_name: 'foo' } }
        run_test!
      end
    end
  end
end