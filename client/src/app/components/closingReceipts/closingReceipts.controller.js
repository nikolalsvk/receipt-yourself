export class ClosingReceiptsController {
  constructor($mdEditDialog, $q, $scope, $timeout, $rootScope, closingReceipts, dailyStatement) {
    'ngInject';
      
      $scope.close = function () {
        if($scope.type == 'upper') {
          
          new closingReceipts({
            daily_statements: $rootScope.selectedDSUpper,
            input_invoice: $rootScope.selectedInputInvoice,
            type: $scope.type
          }).create();

        } else {

          new closingReceipts({
            daily_statements: $rootScope.selectedDSBottom,
            output_invoice: $rootScope.selectedOutputInvoice,
            type: $scope.type
          }).create();
          
        }
        $rootScope.$broadcast('closedInvoice', []);
      }
  }
}
