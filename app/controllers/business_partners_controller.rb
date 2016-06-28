class BusinessPartnersController < ApplicationController
  before_action :set_business_partner, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @business_partners = BusinessPartner.all
    respond_with(@business_partners)
  end

  def show
    respond_with(@business_partner)
  end

  def new
    @business_partner = BusinessPartner.new
    respond_with(@business_partner)
  end

  def edit
  end

  def create
    @business_partner = BusinessPartner.new(business_partner_params)
    @business_partner.save
    respond_with(@business_partner)
  end

  def update
    @business_partner.update(business_partner_params)
    respond_with(@business_partner)
  end

  def destroy
    @business_partner.destroy
    respond_with(@business_partner)
  end

  private
    def set_business_partner
      @business_partner = BusinessPartner.find(params[:id])
    end

    def business_partner_params
      params[:business_partner]
    end
end
