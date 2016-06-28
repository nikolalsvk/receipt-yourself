export function OutputInvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '='
    },
    templateUrl: 'app/components/invoiceTables/outputInvoiceTable.html',
    controller: 'OutputInvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
