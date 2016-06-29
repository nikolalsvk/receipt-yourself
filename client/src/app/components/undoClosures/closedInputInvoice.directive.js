export function ClosedInputInvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      dailyStatementId: '='
    },
    templateUrl: 'app/components/undoClosures/closedInputInvoice.html',
    controller: 'ClosedInputInvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
