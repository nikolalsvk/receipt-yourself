export class InputInvoiceController {
  constructor($mdEditDialog, $q, $scope, $timeout, inputInvoice) {
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

    inputInvoice.query().then(function(results) {
      that.inputInvoices = results;
    });

    $scope.toggleLimitOptions = function () {
      $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
    };

    $scope.loadStuff = function () {
      inputInvoice.query().then(function(results) {
        this.inputInvoices = results;
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

      inputInvoice.query({ business_partner_id: item.id })
      .then(function (results) {
        that.inputInvoices = results;
      }, function (error) {
        alert('[input invoices]: error filter fetching data from database.');
      });

    });

    $scope.test = function() {
      alert('ITS WORKING!');
    }

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
