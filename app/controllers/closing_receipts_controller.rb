class ClosingReceiptsController < ApplicationController
  respond_to :json

  def create
    parsed_closing_receipts = ActiveSupport::JSON.decode(params[:closing_receipts].to_json)
    type = parsed_closing_receipts['type']

    if type == 'upper'
      selected_input_invoice_id = parsed_closing_receipts['input_invoice'][0]['id']
      parsed_closing_receipts['daily_statements'].each { |el|
        InputInvoiceClosure.create!(daily_statement_id: el['id'], input_invoice_id: selected_input_invoice_id)
      }
    else
      selected_output_invoice_id = parsed_closing_receipts['output_invoice'][0]['id']
      parsed_closing_receipts['daily_statements'].each { |el|
        OutputInvoiceClosure.create!(daily_statement_id: el['id'], output_invoice_id: selected_output_invoice_id)
      }
    end
  end

  private
  def input_invoice_params
    params[:closing_receipts]
  end
end
