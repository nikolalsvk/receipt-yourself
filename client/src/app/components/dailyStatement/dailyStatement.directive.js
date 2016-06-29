export function DailyStatementDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      type: "=",
      typeSign: "="
    },
    templateUrl: 'app/components/dailyStatement/dailyStatementTable.html',
    controller: 'DailyStatementController',
    controllerAs: 'dailyStatementCtrl',
  };

  return directive;
}
