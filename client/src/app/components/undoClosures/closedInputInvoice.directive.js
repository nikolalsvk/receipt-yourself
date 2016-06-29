export function ClosedOutputInvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      dailyStatementId: '='
    },
    templateUrl: 'app/components/invoiceTables/outputInvoiceTable.html',
    controller: 'ClosedInputInvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
