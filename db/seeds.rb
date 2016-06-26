require 'faker'


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


ContactCard.destroy_all

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