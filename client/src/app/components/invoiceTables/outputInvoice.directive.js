export function OutputInvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      dailyStatementId: '='
    },
    templateUrl: 'app/components/invoiceTables/outputInvoiceTable.html',
    controller: 'OutputInvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
