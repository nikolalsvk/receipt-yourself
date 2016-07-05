export class SignUpController {
  constructor ($scope, $auth, $mdToast, $state) {
    'ngInject';

    let errors = {};

    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm)
        .then(function() {
          $auth.submitLogin({
            email: $scope.registrationForm.email,
            password: $scope.registrationForm.password
          })
          $state.go("invoices");
        })
        .catch(function(resp) {
          errors = resp.data.errors.full_messages;

          errors.forEach(function(error) {
            $mdToast.show($mdToast.simple(error));
          });
        });
    };
  }
}
