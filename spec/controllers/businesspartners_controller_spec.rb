require 'rails_helper'

RSpec.describe BusinesspartnersController, type: :controller do

  describe "GET #receive_data" do
    it "returns http success" do
      get :test
      expect(response).to have_http_status(:success)
    end
  end

end
