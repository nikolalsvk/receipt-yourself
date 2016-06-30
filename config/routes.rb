Rails.application.routes.draw do

  resources :daily_statement_items, except: [:new, :edit]
  resources :daily_statements, except: [:new, :edit]
  scope '/api/' do
    mount_devise_token_auth_for 'User', at: 'auth'

    post "businesspartners/receivedata" => "businesspartners#receive_data"
    post "businesspartners/acceptinvoice" => "businesspartners#accept_invoice"
    post "banks/receivedata" => "banks#receive_data"
    post "banks/receviedailystatement" => "banks#receive_daily_statement"

    post "reports/kif" => "reports#kif"
    post "reports/kuf" => "reports#kuf"
    post "reports/partner_card" => "reports#partner_card"
    post "reports/ios" => "reports#ios"

    resources :input_invoices, except: [:new, :edit], defaults: { format: 'json' }

    resources :output_invoices, except: [:new, :edit], defaults: { format: 'json' }

    resources :business_partners, except: [:new, :edit]

    resources :daily_bank_statements, except: [:new, :edit]

    resources :daily_statements, except: [:new, :edit], defaults: { format: 'json' }
  end

end
