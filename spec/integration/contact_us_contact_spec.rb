require 'swagger_helper'

describe 'Contact API' do

  path '/contact_us_contact' do

    post 'Creates a contact' do
      tags 'Contacts'
      consumes 'application/json'
      parameter name: :contact_us_contact, in: :body, schema: {
        type: :object,
        properties: {
        name: { type: :string },
        email: { type: :string },
        message: { type: :string }
      },
        required: [ 'name', 'email', 'message' ]
      }

      response '201', 'contact created' do
        let(:contact_us_contact) { { name: 'foo', email: 'bar@example.com', message: 'Need help' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:contact_us_contact) { { name: 'foo' } }
        run_test!
      end
    end
  end
end