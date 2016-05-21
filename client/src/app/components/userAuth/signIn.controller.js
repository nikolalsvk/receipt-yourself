export class SignInController {
  constructor ($scope) {
    'ngInject';

    $scope.$on('auth:login-error', function(ev, reason) {
      $scope.error = reason.errors[0];
    });
  }
}
