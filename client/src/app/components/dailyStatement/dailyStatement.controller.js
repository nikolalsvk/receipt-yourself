export class DailyStatementController {
  constructor($mdEditDialog, $q, $scope, $timeout, dailyStatement) {
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

    dailyStatement.query().then(function(results) {
      that.dailyStatements = results;
    });

    $scope.toggleLimitOptions = function () {
      $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
    };

    $scope.loadStuff = function () {
      dailyStatement.query().then(function(results) {
        this.dailyStatement = results;
      });

      $scope.promise = $timeout(function () {
        // loading
      }, 2000);
    }

    $scope.logItem = function (item) {
      debugger
      console.log(alert($scope.selected));
    };

    $scope.$on('changedBusinessPartner', function(event, item) {

      dailyStatement.query({ business_partner_id: item.id })
      .then(function (results) {
          debugger
          that.dailyStatements = results;
      }, function (error) {
              alert('[daily statements]: error filter fetching data from database.');
      });

    });

    $scope.logOrder = function (order) {
      console.log('order: ', order);
    };

    $scope.closeReceipt = function() {
      if($scope.selected != null) {
        alert('Closing input receipt: ' + $scope.selected[0].number);
      }
    }

    $scope.logPagination = function (page, limit) {
      console.log('page: ', page);
      console.log('limit: ', limit);
    }
  }
}
