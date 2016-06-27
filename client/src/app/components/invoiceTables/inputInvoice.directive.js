export function InputInvoiceDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '='
    },
    templateUrl: 'app/components/invoiceTables/inputInvoiceTable.html',
    controller: 'InputInvoiceController',
    controllerAs: 'invoiceCtrl'
  };

  return directive;
}
