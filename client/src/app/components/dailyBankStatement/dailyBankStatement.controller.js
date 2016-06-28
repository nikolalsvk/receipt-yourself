export class DailyBankStatementController {
  constructor($mdEditDialog, $q, $scope, $timeout, dailyBankStatement) {
    'ngInject';

    $scope.selected = [];
    $scope.limitOptions = [5, 10, 15];

    this.dailyBankStatement = dailyBankStatement;

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
      limit: 10,
      page: 1
    };

    let that = this

    this.getDailyBankStatements(that);
  }

  getDailyBankStatements(that) {
    that.dailyBankStatement.query().then(function(results) {
      that.dailyBankStatements = results;
    });
  }

  loadStuff(that) {
    that.getDailyBankStatements(that);
  }

  showDailyStatements(item) {

  }
}
