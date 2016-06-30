class ReportsController < ApplicationController

  def kif
    # temp user
    u = User.first
    info = JSON.parse(OutputInvoice.where(company: u.company).to_json)
    sendJSON(u.email, u.company, info, '/kif')
  end

  def kuf
    u = User.first
    input_invoices = []
    u.company.financial_years.each do |year|
      year.input_invoices.each do |ii|
        input_invoices << ii
      end
    end
    info = JSON.parse(input_invoices.to_json)
    sendJSON(u.email, u.company, info, '/kuf')
  end

  def partner_card
    u = User.first
    input_invoices = []
    output_invoices = []
    BusinessPartner.find_each do |partner|
      input_invoices << partner.input_invoices
      output_invoices << partner.output_invoices
    end
    ii = JSON.parse(input_invoices.to_json)
    oo = JSON.parse(output_invoices.to_json)
    sendJSON(u.email, u.company, [ii, oo], '/partner_card')
  end

  def ios
    u = User.first
    opened_output = JSON.parse(OutputInvoice.opened.to_json)
    opened_input = JSON.parse(InputInvoice.opened.to_json)
    sendJSON(u.email, u.company, [opened_output, opened_input], '/ios')
  end

  private

  def sendJSON(email, company, info, path)
    set_JSON_destination
    RestClient.post @rg_address + path, {:data=> {email: email, 
                                                  company: company,
                                                  info: info}.to_json}
  end

  def set_JSON_destination
    @rg_address = if Rails.env.development?
                    "http://localhost:9292"
                  elsif Rails.env.production?
                    "https://ry-report-generator.herokuapp.com"
                  end
  end

end
