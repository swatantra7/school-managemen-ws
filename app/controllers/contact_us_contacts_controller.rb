class ContactUsContactsController < ApplicationController

  def create
    @contact = ContactUs::Contact.new(params[:contact_us_contact])
    if @contact.save
      render json: {
        sucess: "mail sent successfully",
        status: 200
      }, status: 200
    else
      render json: {
       error: "No such user; check the submitted email address",
        status: 400
      }, status: 400  
    end 
  end

end
