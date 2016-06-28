export class DailyBankStatement {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/daily_bank_statements',
      name: 'daily_bank_statement'
    });
  }

  static dailyBankStatement(railsResourceFactory) {
    return new DailyBankStatement(railsResourceFactory);
  }

}
