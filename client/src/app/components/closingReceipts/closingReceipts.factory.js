export class ClosingReceipts {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/closing_receipts/create',
      name: 'closing_receipts'
    });
  }

  static closingReceipts(railsResourceFactory) {
    return new ClosingReceipts(railsResourceFactory);
  }

}
