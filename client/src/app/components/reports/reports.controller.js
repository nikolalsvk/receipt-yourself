export class ReportsController {
  constructor($mdEditDialog, $q, $scope,$mdToast, $timeout, $rootScope, businessPartner, closingReceipts, reports) {
    'ngInject';
      
    businessPartner.query().then(function(results) {
      debugger
      $scope.reportsCtrl.businessPartners = results;
    }); 

    $scope.generateReport = function () {
      new reports({
        user: $rootScope.user,
        type: $scope.reportsCtrl.selectedType,
        bpContactCardId: $scope.reportsCtrl.bpContactCardId
      }).create();

      $mdToast.show($mdToast.simple('Successfuly generated reports!'));
    }
    
  }
}
