class BanksController < ApplicationController

  def receive_data
    basic_info = params[:basicInfo]
    contact_info = params[:contactInfo]

    bank = Bank.new
    contact_card = ContactCard.new

    bank.contact_card = contact_card
    bank.from_json(basic_info)
    contact_card.from_json(contact_info)

    ActiveRecord::Base.transaction do
      contact_card.save!
      bank.save!
    end

    render :html => "<h3>[Receipt-Yourself]: Added new bank as a partner.</h3><br/>Data:#{basic_info}".html_safe
  end

  def receive_daily_statement
    statement_info = params[:statementInfo]
    items_info = params[:itemsInfo]
    
    parsed_statement = ActiveSupport::JSON.decode(statement_info)
    parsed_items = ActiveSupport::JSON.decode(items_info)

    #fixing typo
    statement_info.sub! 'new_amount', 'new_amout'

    daily_bank_statement = DailyBankStatement.new
    daily_bank_statement.from_json(statement_info)

    business_partners = Array.new

    # store b.partners ids
    parsed_items.each_with_index { |ds, index|
      business_partnerQuery = BusinessPartner.where(name: ds['business_partner']['name'])
      business_partners.push(business_partnerQuery[0])

      ds.delete('business_partner')

      daily_statement = DailyStatement.new
      daily_statement.from_json(ds.to_json)
      daily_statement['business_partner_id'] = business_partners[index]['id']
      daily_statement['currency_date'] = format_date(ds['currency_date'])
      daily_statement['payment_date'] = format_date(ds['payment_date'])
      daily_statement.save! # debugg tracer
      daily_bank_statement.daily_statements.push(daily_statement)
    }

    #Java date -> Ruby
    daily_bank_statement['statement_date'] = format_date(parsed_statement['statement_date'])

    ActiveRecord::Base.transaction do
      daily_bank_statement.save!
    end

    render :html => "<h3>[Receipt-Yourself]: Added new bank daily statement.</h3><br/>Data:#{statement_info}#{items_info}".html_safe
  end

  def format_date(date)
    t = Time.at(date/1000)
    return t.to_s
  end

end
