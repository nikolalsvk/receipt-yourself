export class BusinessPartner {

  constructor(railsResourceFactory) {
    'ngInject';

    return railsResourceFactory({
      url: '/api/business_partners',
      name: 'business_partner'
    });
  }

  static businessPartner(railsResourceFactory) {
    return new BusinessPartner(railsResourceFactory);
  }

}
