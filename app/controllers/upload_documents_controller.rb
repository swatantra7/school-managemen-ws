class UploadDocumentsController < ApplicationController

  def create
    @document = Document.new(upload_document_params)
    if @document.save
      render json: {
        sucess: 'Document saved sucessfully',
        status: 200
      }, status: 200
    else
      render json: {
        error: 'Failed to Upload Document',
        status: 400
      }, status: 400
    end
  end

  def index
    @documents = Document.all
    @document_urls = @documents.map(&:documents).map(&:expiring_url)
      render json: {
        documents: @documents,
        urls: @document_urls,
        status: 200
      }, status: 200
  end

  private

  def upload_document_params
    params.require(:upload_document).permit(
      :documents,
      :name
    )
  end

end
