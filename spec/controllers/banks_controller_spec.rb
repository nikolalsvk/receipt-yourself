require 'rails_helper'

RSpec.describe BanksController, type: :controller do

  describe "GET #receive_data" do
    it "returns http success" do
      get :recieve_data
      expect(response).to have_http_status(:success)
    end
  end

end
