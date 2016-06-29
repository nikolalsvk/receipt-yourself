export class DailyBankStatementController {
  constructor($state, $scope, dailyBankStatement) {
    'ngInject';

    $scope.selected = [];
    $scope.limitOptions = [5, 10, 15];

    this.dailyBankStatement = dailyBankStatement;
    this.$state = $state

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

    $scope.showDailyStatements = (item) => {
      if($state.current.name == "dailyStatements") {
        $state.go("dailyStatements", {id: item.id}, {reload: true});
      } else {
        $state.go("undoClosuresForBankStatement", {id: item.id}, {reload: true});
      }
    }
  }

  getDailyBankStatements(that) {
    that.dailyBankStatement.query().then(function(results) {
      that.dailyBankStatements = results;
    });
  }

  loadStuff(that) {
    that.getDailyBankStatements(that);
  }

}
