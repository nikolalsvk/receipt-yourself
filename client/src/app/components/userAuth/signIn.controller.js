export class SignInController {
  constructor ($scope, $auth, $mdToast) {
    'ngInject';

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(user) {
        })
        .catch(function(reason) {
          $mdToast.show($mdToast.simple(reason.errors[0]));
        });
    }
  }
}
