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
    parsed_statement = ActiveSupport::JSON.decode(items_info)

    #fixing typo
    statement_info.sub! 'new_amount', 'new_amout'

    daily_bank_statement = DailyBankStatement.new
    daily_bank_statement.from_json(statement_info)

    daily_statement = DailyStatement.new
    daily_statements = Array.new

    parsed_statement.each { |el|
      daily_statements.push(daily_statement.from_json(el.to_json))
    }

    daily_bank_statement.daily_statements = daily_statements

    ActiveRecord::Base.transaction do
      daily_bank_statement.save!
    end

    render :text => "[Receipt-Yourself]: Added new bank daily statement.", :status => 200
  end

  def format_date(date, date_format)
    t = Time.at(date.time/1000)
    return t.strftime(date_format)
  end

end
