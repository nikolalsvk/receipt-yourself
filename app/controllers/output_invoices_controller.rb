class OutputInvoicesController < ApplicationController
  before_action :set_output_invoice, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @output_invoices = OutputInvoice.all
    respond_with(@output_invoices)
  end

  def show
    respond_with(@output_invoice)
  end

  def new
    @output_invoice = OutputInvoice.new
    respond_with(@output_invoice)
  end

  def edit
  end

  def create
    @output_invoice = OutputInvoice.new(output_invoice_params)
    @output_invoice.save
    respond_with(@output_invoice)
  end

  def update
    @output_invoice.update(output_invoice_params)
    respond_with(@output_invoice)
  end

  def destroy
    @output_invoice.destroy
    respond_with(@output_invoice)
  end

  private
    def set_output_invoice
      @output_invoice = OutputInvoice.find(params[:id])
    end

    def output_invoice_params
      params[:output_invoice]
    end
end