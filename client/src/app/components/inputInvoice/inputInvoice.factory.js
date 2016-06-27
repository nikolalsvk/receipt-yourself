export class InputInvoice {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/input_invoices',
      name: 'input_invoice'
    });
  }

  static inputInvoice(railsResourceFactory) {
    return new InputInvoice(railsResourceFactory);
  }

}
