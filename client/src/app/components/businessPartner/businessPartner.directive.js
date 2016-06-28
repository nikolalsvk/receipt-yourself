export function BusinessPartnerDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '='
    },
    templateUrl: 'app/components/businessPartner/businessPartnerTable.html',
    controller: 'BusinessPartnerController',
    controllerAs: 'partnerCtrl'
  };

  return directive;
}
