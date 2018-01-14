class Document < ApplicationRecord

  attr_accessor :document_file_name

  has_attached_file :documents, 
                :url  => "/assets/images/:id/:style/:basename.:extension",
                :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"


  validates_attachment_content_type :documents, :content_type => ['image/jpeg', 'image/png']


end
