require 'faker'

PaymentProposal.destroy_all
ContactCard.destroy_all

def seed_users(company, no_users=1)
    no_users.times do
      num = User.count
      User.create!(email: "user_#{num}@ry.com",
                   password: 'receiptyourself',
                   password_confirmation: 'receiptyourself',
                   company_id: company.id)
    end
end

def seed_financial_years(company, no_years=5)
  start_year = 2010
  no_years.times do
    FinancialYear.create!(year: start_year,
                          company_id: company.id)
    start_year +=1
  end
end

def seed_daily_statement(db_statement)
  DailyStatement.create!( debtor_account_number: Faker::Number.number(18),
                          debtor_account_name: Faker::Name.name,
                          debtor_account_city: Faker::Address.city,
                          debtor_model_number: Faker::Number.number(2),
                          debtor_reference_number: Faker::Number.number(12),
                          debtor_payment_purpose: Faker::Lorem.sentence,
                          creditor_model_number: Faker::Number.number(2),
                          creditor_reference_number: Faker::Number.number(12),
                          creditor_account_number: Faker::Number.number(18),
                          approval_reference_number: Faker::Number.number(12),
                          payment_number: Faker::Number.number(3),
                          payment_currency: Constants::Currency::CURRENCY_HASH.keys.sample,
                          transfer_amount: Faker::Number.decimal(10, 4),
                          account_city: Faker::Address.city,
                          currency_date: Date.today,
                          payment_date: Date.today,
                          calculation_method: [:bruto, :neto].sample,
                          priority: Constants::Priority::PRIORITY_ARRAY.sample,
                          status: [:executed,                   # Izvršen nalog
                                   :not_executed_user_error,    # Neizvršen zbog nelikvidnosti podračuna korisnika
                                   :not_executed_carrier_error, # Neizvršen zbog nelikvidnosti računa nosioca u NBJ
                                   :unauthorized,               # Nalog nije odobren za izvršenje- neviziran nalog
                                   :wrong,                      # Pogrešan nalog
                                   :stopped].sample,
                          remaining_amount: Faker::Number.decimal(3, 4),
                          daily_bank_statement_id: db_statement.id,
                          business_partner_id: BusinessPartner.order("RANDOM()").first.id)
end

def seed_daily_bank_statement(company_account, no_of_statements=5)
  no_of_statements.times do |i|
    db_statement = DailyBankStatement.create!(number: Faker::Number.number(10), 
                                              statement_date: DateTime.now - i.days,
                                              previous_amount: Faker::Number.decimal(2, 4),
                                              new_amout: Faker::Number.decimal(2, 4),
                                              reserved_amount: Faker::Number.decimal(2, 4),
                                              total_payment: Faker::Number.decimal(2, 4),
                                              total_payout: Faker::Number.decimal(2, 4),
                                                company_account_id: company_account.id)
    seed_daily_statement(db_statement)
  end
end

10.times do |i|
  ContactCard.create!(pib: Faker::Number.number(8),
                     country: Faker::Address.country,
                     city: Faker::Address.city,
                     address: Faker::Address.street_address,
                     email: Faker::Internet.email,
                     website: Faker::Internet.url,
                     phone: Faker::PhoneNumber.phone_number)
  
  if i % 2 == 0
    company = Company.create!(name: Faker::Company.name, contact_card_id: ContactCard.last.id)
    seed_users(company)
    seed_financial_years(company)
  elsif i % 3 == 0
    Bank.create!(name: Faker::Company.name, contact_card_id: ContactCard.last.id)
  else 
    BusinessPartner.create(name: Faker::Company.name,
                           category: Random.rand(0..2))
  end
  
end

# each company will have a company account
#   and they will have a randomly selected bank
Company.find_each do |company|
  company_account = CompanyAccount.create!(number: Faker::Number.number(10),
                                           currency: Constants::Currency::CURRENCY_HASH.keys.sample,
                                           company_id: company.id,
                                           bank_id: Bank.order("RANDOM()").first.id)
  seed_daily_bank_statement(company_account)
end

# each business partner will have an account
#   and they will have randomly selected bank
BusinessPartner.find_each do |business_partner|
  BusinessPartnerAccount.create!(number: Faker::Number.number(10), 
                                 activated: [true, false].sample,
                                 business_partner_id: business_partner.id,
                                 bank_id: Bank.order("RANDOM()").first.id)
  
  # also seeding input invoices here, jbg
  FinancialYear.find_each do |financial_year|
    1.times do |i|
      InputInvoice.create!(number: Faker::Number.number(12),
                           payment_amount: Faker::Number.decimal(11, 4),
                           remaining_amount: Faker::Number.decimal(11, 4),
                           issuance_date: Date.today - i.days,
                           circulation_date: Date.today - i.days, 
                           payment_deadline: Date.today - i.days,
                           business_partner_id: business_partner.id,
                           financial_year_id: financial_year.id)
    end
    # also output invoices.. :(
    1.times do |i|
      OutputInvoice.create!(number: Faker::Number.number(12),
                            payment_amount: Faker::Number.decimal(11, 4),
                            remaining_amount: Faker::Number.decimal(11, 4),
                            issuance_date: Date.today,
                            circulation_date: Date.today,
                            payment_deadline: Date.today,
                            business_partner_id: business_partner.id,
                            financial_year_id: financial_year.id,
                            company_id: financial_year.company.id)
    end
  end
end

10.times do |i|
    pp = PaymentProposal.create!(payment_date: Date.today - i.days,
                                 number: Faker::Number.number(6),
                                 status: 1)
end

PaymentProposal.find_each do |pp|
  input_invoice = InputInvoice.order("RANDOM()").first
  PaymentForming.create!(amount: Faker::Number.decimal(10, 4),
                         input_invoice_id: input_invoice.id,
                         company_account_id: input_invoice.financial_year.company.company_accounts.first.id,
                         payment_proposal_id: pp.id)
end

PaymentForming.find_each do |pf|
  PaymentOrder.create!( debtor_account_number: Faker::Number.number(18),
                        debtor_account_name: Faker::Name.name,
                        debtor_account_city: Faker::Address.city,
                        debtor_model_number: Faker::Number.number(2),
                        debtor_reference_number: Faker::Number.number(12),
                        debtor_payment_purpose: Faker::Lorem.sentence,
                        creditor_model_number: Faker::Number.number(2),
                        creditor_reference_number: Faker::Number.number(12),
                        creditor_account_number: Faker::Number.number(18),
                        payment_method: Constants::Priority::PRIORITY_ARRAY.sample,
                        approval_reference_number: Faker::Number.number(12),
                        payment_number: Faker::Number.number(3),
                        transfer_amount: Faker::Number.decimal(10, 4),
                        account_city: Faker::Address.city,
                        currency_date: Date.today,
                        payment_date: Date.today,
                        payment_forming_id: pf.id)
end