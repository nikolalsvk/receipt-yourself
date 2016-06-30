export class OutputInvoiceController {
  constructor($mdEditDialog, $rootScope, $q, $scope, $timeout, outputInvoice) {
    'ngInject';

    $scope.selected = [];
    $scope.limitOptions = [5, 10, 15];
    $rootScope.selectedOutputInvoice = [];

    $scope.options = {
      rowSelection: true,
      multiSelect: false,
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

    outputInvoice.query().then(function(results) {
      that.outputInvoices = results;
    });

    $scope.toggleLimitOptions = function () {
      $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
    };

    $scope.loadStuff = function () {
      outputInvoice.query().then(function(results) {
        this.outputInvoices = results;
      });

      $scope.promise = $timeout(function () {
        // loading
      }, 2000);
    }

    $scope.hasRemainingAmount = function (item) { 
      return item.remainingAmount > 0; 
    };

    $scope.logItem = function (item) {
      $rootScope.selectedOutputInvoice = $scope.selected;
    };

    $scope.logOrder = function (order) {
      console.log('order: ', order);
    };

    $scope.$on('changedBusinessPartner', function(event, item) {

     outputInvoice.query({ business_partner_id: item.id })
      .then(function (results) {
          debugger
          that.outputInvoices = results;
      }, function (error) {
              alert('[output invoices]: error filter fetching data from database.');
      });

    });

    $scope.closeReceipt = function() {
      if($scope.selected != null) {
        alert('Closing output receipt: ' + $scope.selected[0].number);
      }
    }

    $scope.logPagination = function (page, limit) {
      console.log('page: ', page);
      console.log('limit: ', limit);
    }
  }
}
