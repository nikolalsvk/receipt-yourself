export class SignInController {
  constructor ($scope, $rootScope, $auth, $mdToast, $state) {
    'ngInject';

    $rootScope.$on('auth:logout-success', function(ev) {
      $state.go("home");
    });

    $scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(user) {
          $state.go("invoices");
        })
        .catch(function(reason) {
          $mdToast.show($mdToast.simple(reason.errors[0]));
        });
    }
  }
}
