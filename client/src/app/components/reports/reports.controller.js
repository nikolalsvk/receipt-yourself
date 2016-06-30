export class ReportsController {
  constructor($mdEditDialog, $q, $scope,$mdToast, $timeout, $rootScope, closingReceipts, reports) {
    'ngInject';
      
      $scope.generateReport = function () {
          
          new reports({
            user: $rootScope.user
          }).create();

          $mdToast.show($mdToast.simple('Successfuly generated reports!'));
    }
  }
}
