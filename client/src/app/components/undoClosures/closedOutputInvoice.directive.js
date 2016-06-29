export function ClosedOutputInvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      dailyStatementId: '='
    },
    templateUrl: 'app/components/undoClosures/closedOutputInvoice.html',
    controller: 'ClosedOutputInvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
