export class Reports {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/reports/create',
      name: 'reports'
    });
  }

  static reports(railsResourceFactory) {
    return new Reports(railsResourceFactory);
  }

}
