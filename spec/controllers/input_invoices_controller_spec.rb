require 'rails_helper'
require 'controllers/shared/shared_contexts'

RSpec.describe InputInvoicesController, type: :controller do

  include_context "user is logged in"

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  pending do
    describe "GET index" do
      before do
        get :index
      end

      it "assigns @input_invoices" do
        expect(assigns[:input_invoices]).to be_a(ActiveRecord::Relation)
      end

      it "responds with success" do
        expect(response.status).to eq(200)
      end
    end
  end

end
