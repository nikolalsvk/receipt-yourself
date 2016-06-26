class BusinesspartnersController < ApplicationController

  def receive_data
    basic_info = params[:basicInfo]
    contact_info = params[:contactInfo]

    business_partner = BusinessPartner.new
    contact_card = ContactCard.new

    business_partner.contact_card = contact_card
    business_partner.from_json(basic_info)
    contact_card.from_json(contact_info)

    ActiveRecord::Base.transaction do
      contact_card.save!
      business_partner.save!
    end

    render :text => "[Receipt-Yourself]: Added new business partner.", :status => 200
  end

  def accept_invoice
    input_invoice_info = params[:invoiceInfo]
    business_partner_info = params[:businessPartnerInfo]

    input_invoice = InputInvoice.new
    business_partner = BusinessPartner.new

    input_invoice.from_json(input_invoice_info)
    business_partner.from_json(business_partner_info)
    input_invoice.business_partner = business_partner

    ActiveRecord::Base.transaction do
      business_partner.save!
    end

    render :text => "[Receipt-Yourself]: Added new input invoice.", :status => 200
  end

end
