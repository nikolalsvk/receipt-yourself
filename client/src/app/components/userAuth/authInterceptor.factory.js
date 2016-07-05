export class AuthInterceptor {

  constructor($rootScope, $state) {
    var sessionInjector = {
        request: function(config) {
            if (!$rootScope.user.id) {
                $state.go('home');
            }
        }
    };
    return sessionInjector;
  }

}
