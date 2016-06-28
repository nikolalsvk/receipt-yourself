export class OutputInvoice {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/output_invoices',
      name: 'output_invoice'
    });
  }

  static outputInvoice(railsResourceFactory) {
    return new OutputInvoice(railsResourceFactory);
  }

}
