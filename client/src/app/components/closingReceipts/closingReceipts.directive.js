export function ClosingReceiptsDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      type: "=",
    },
    templateUrl: 'app/components/closingReceipts/closingReceipts.html',
    controller: 'ClosingReceiptsController',
    controllerAs: 'closingReceiptsCtrl',
  };

  return directive;
}
