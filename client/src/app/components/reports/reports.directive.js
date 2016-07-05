export function ReportsDirective() {
  'ngInject';

  let directive = {
    restrict: 'E',
    scope: {
      extraValues: '=',
      type: "=",
      showForm: "="
    },
    templateUrl: 'app/components/reports/reports.html',
    controller: 'ReportsController',
    controllerAs: 'reportsCtrl',
  };

  return directive;
}
