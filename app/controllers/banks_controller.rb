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

    render :text => "[Receipt-Yourself]: Added new bank as a partner.", :status => 200
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

    daily_statement = DailyStatement.new

    parsed_items.each { |el|
      daily_bank_statement.daily_statements.push(daily_statement.from_json(el.to_json))
    }

    #Java date -> Ruby
    daily_bank_statement['statement_date'] = format_date(parsed_statement['statement_date'])
    daily_bank_statement.daily_statements[0]['currency_date'] = format_date(parsed_items[0]['currency_date'])
    daily_bank_statement.daily_statements[0]['payment_date'] = format_date(parsed_items[0]['payment_date'])
    daily_bank_statement.daily_statements[1]['currency_date'] = format_date(parsed_items[1]['currency_date'])
    daily_bank_statement.daily_statements[1]['payment_date'] = format_date(parsed_items[1]['payment_date'])

    ActiveRecord::Base.transaction do
      daily_bank_statement.save!
    end

    render :text => "[Receipt-Yourself]: Added new bank daily statement.", :status => 200
  end

  def format_date(date)
    t = Time.at(date/1000)
    return t.to_s
  end

end
