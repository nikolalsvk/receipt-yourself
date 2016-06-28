export class DailyStatement {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/daily_statements',
      name: 'daily_statement'
    });
  }

  static dailyStatement(railsResourceFactory) {
    return new DailyStatement(railsResourceFactory);
  }

}
