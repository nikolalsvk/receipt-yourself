class RemoveNullConstraintsFromInvoices < ActiveRecord::Migration
  def change
    change_column_null :input_invoices, :circulation_date, true
    change_column_null :output_invoices, :circulation_date, true
  end
end
