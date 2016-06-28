export class DailyBankStatementItem {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/daily_statement_items',
      name: 'daily_statement'
    });
  }

  static dailyBankStatementItem(railsResourceFactory) {
    return new DailyBankStatementItem(railsResourceFactory);
  }

}
