export function InvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '='
    },
    templateUrl: 'app/components/invoiceTable/invoiceTable.html',
    controller: 'InvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
