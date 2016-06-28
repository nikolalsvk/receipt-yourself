export function DailyBankStatementItemDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '='
    },
    templateUrl: 'app/components/dailyBankStatementItem/dailyBankStatementItemTable.html',
    controller: 'DailyBankStatementItemController',
    controllerAs: 'statementItemCtrl'
  };

  return directive;
}
