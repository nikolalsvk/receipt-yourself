export function runBlock ($log, $location, $rootScope) {
  'ngInject';
  $log.debug('runBlock end');

  $rootScope.$on('auth:login-success', function() {
    $location.path('/');
  });
}
