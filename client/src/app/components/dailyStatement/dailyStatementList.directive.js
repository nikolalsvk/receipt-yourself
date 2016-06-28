export function DailyStatementListDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      type: "="
    },
    templateUrl: 'app/components/dailyStatement/dailyStatementTable.html',
    controller: 'DailyStatementListController',
    controllerAs: 'dailyStatementCtrl',
  };

  return directive;
}
