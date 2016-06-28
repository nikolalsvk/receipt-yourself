export class DailyStatementListController {
  constructor($scope, $stateParams, $rootScope, dailyStatement) {
    'ngInject';

    $scope.selected = [];
    $scope.limitOptions = [5, 10, 15];

    $scope.options = {
      rowSelection: true,
      multiSelect: true,
      autoSelect: true,
      decapitate: false,
      largeEditDialog: false,
      boundaryLinks: false,
      limitSelect: true,
      pageSelect: true
    };

    $scope.query = {
      order: 'name',
      limit: 5,
      page: 1
    };

    let that = this

    dailyStatement.query({ dailyBankStatementId: $stateParams.id }).then(function(results) {
      that.dailyStatements = results;
    });

    $scope.loadStuff = function () {
      dailyStatement.query().then(function(results) {
        this.dailyStatement = results;
      });

      $scope.promise = $timeout(function () {
        // loading
      }, 2000);
    }

    $scope.logItem = function (item) {
      console.log(alert($scope.selected));
      $rootScope.$broadcast('changedBusinessPartner', item.businessPartner);
    };

  }
}
