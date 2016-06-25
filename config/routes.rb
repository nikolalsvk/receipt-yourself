Rails.application.routes.draw do

  scope '/api/' do
    mount_devise_token_auth_for 'User', at: 'auth'
    post "businesspartners/recievedata" => "businesspartners#recieve_data"
  end

end
