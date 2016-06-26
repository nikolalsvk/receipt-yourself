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
    parsed_statement = ActiveSupport::JSON.decode(statement_info)

    daily_bank_statement = DailyBankStatement.new
    daily_bank_statement.from_json(statement_info)
    #daily_bank_statement.statement_date = parsed_statement['statement_date']
    #daily_bank_statement.daily_statements = parsed_statement['daily_statements']

    company_account = CompanyAccount.new
    daily_statement = DailyStatement.new

    #daily_statement.from_json(parsed_statement['daily_statements'])

    #company_account.bank_id =

    render :text => "[Receipt-Yourself]: Added new bank daily statement.", :status => 200
  end

end
