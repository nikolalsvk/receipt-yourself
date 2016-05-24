export class SignInController {
  constructor ($scope, $auth) {
    'ngInject';

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(user) {
        })
        .catch(function(reason) {
          $scope.error = reason.errors[0];
        });
    }
  }
}
