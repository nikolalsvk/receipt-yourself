Rails.application.routes.draw do

  scope '/api/' do
    mount_devise_token_auth_for 'User', at: 'auth'
    post "businesspartners/receivedata" => "businesspartners#receive_data"
    post "businesspartners/acceptinvoice" => "businesspartners#accept_invoice"
    post "banks/receivedata" => "banks#receive_data"
  end

end
