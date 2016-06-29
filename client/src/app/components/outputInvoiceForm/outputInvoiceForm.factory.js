export class OutputInvoiceForm {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/output_invoice_form',
      name: 'output_invoice'
    });
  }

  static outputInvoiceForm(railsResourceFactory) {
    return new OutputInvoiceForm(railsResourceFactory);
  }

}
