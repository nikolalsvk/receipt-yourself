export function OutputInvoiceFormDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '='
    },
    templateUrl: 'app/components/outputInvoiceForm/outputInvoiceForm.html',
    controller: 'OutputInvoiceFormController',
    controllerAs: 'outputInvoiceFormCtrl'
  };

  return directive;
}
