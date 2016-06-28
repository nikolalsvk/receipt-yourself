export class DailyBankStatementItemController {
  constructor($rootScope, $mdEditDialog, $q, $scope, $timeout) {
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

    $scope.toggleLimitOptions = function () {
      $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
    };

    $scope.loadStuff = function () {
      dailyBankStatementItem.query().then(function(results) {
        this.dailyBankStatementItems = results;
      });

      $scope.promise = $timeout(function () {
        // loading
      }, 2000);
    }

    $scope.$on('changedBusinessPartner', function(event, item) {

      dailyBankStatementItem.query({ business_partner_id: item.id })
      .then(function (results) {
          that.dailyBankStatementItems = results;
      }, function (error) {
              alert('[db statement]: error filter fetching data from database.');
      });

    });

    $scope.logOrder = function (order) {
      console.log('order: ', order);
    };

    $scope.logPagination = function (page, limit) {
      console.log('page: ', page);
      console.log('limit: ', limit);
    }
  }
}
