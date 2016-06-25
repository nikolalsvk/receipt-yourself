class BusinesspartnersController < ApplicationController

  def recieve_data
    @basic_info = params[:basicInfo]
    @contact_info = params[:contactInfo]

    @business_partner = BusinessPartner.new
    @contact_card = ContactCard.new

    @business_partner.contact_card = @contact_card
    @business_partner.from_json(@basic_info)
    @contact_card.from_json(@contact_info)

    @contact_card.save!
    @business_partner.save!
  end

end
