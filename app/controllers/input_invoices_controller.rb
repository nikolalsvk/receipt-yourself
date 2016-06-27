class InputInvoicesController < ApplicationController
  before_action :set_input_invoice, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @input_invoices = InputInvoice.all
    respond_with(@input_invoices)
  end

  def show
    respond_with(@input_invoice)
  end

  def new
    @input_invoice = InputInvoice.new
    respond_with(@input_invoice)
  end

  def edit
  end

  def create
    @input_invoice = InputInvoice.new(input_invoice_params)
    @input_invoice.save
    respond_with(@input_invoice)
  end

  def update
    @input_invoice.update(input_invoice_params)
    respond_with(@input_invoice)
  end

  def destroy
    @input_invoice.destroy
    respond_with(@input_invoice)
  end

  private
  def set_input_invoice
    @input_invoice = InputInvoice.find(params[:id])
  end

  def input_invoice_params
    params[:input_invoice]
  end
end