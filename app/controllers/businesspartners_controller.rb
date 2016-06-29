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

    render :html => "<h3>[Receipt-Yourself]: Added new business partner.</h3><br/>Data:#{basic_info}".html_safe
  end

  def accept_invoice
    input_invoice_info = params[:invoiceInfo]
    business_partner_info = params[:businessPartnerInfo]

    parsed_input_invoice = ActiveSupport::JSON.decode(input_invoice_info)
    parsed_business_partner = ActiveSupport::JSON.decode(business_partner_info)

    input_invoice = InputInvoice.new
    business_partnerQuery = BusinessPartner.where(name: parsed_business_partner['name'])
    business_partner = BusinessPartner.new

    business_partner.id = business_partnerQuery[0]['id']

    input_invoice.from_json(input_invoice_info)

    #Java date -> Ruby
    input_invoice['issuance_date'] = format_date(parsed_input_invoice['issuance_date'])
    input_invoice['circulation_date'] = format_date(parsed_input_invoice['circulation_date'])
    input_invoice['payment_deadline'] = format_date(parsed_input_invoice['payment_deadline'])

    input_invoice.business_partner = business_partner

    ActiveRecord::Base.transaction do
      input_invoice.save!
    end

    render :html => "<h3>[Receipt-Yourself]: Added new input invoice.</h3><br/>Data:#{input_invoice_info}".html_safe
  end

  def format_date(date)
    t = Time.at(date/1000)
    return t.to_s
  end

end
