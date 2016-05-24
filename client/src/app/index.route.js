export function routerConfig ($stateProvider, $urlRouterProvider, $locationProvider) {
  'ngInject';

  // Enable HTML5 Mode
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  });

  $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'app/main/main.html',
      controller: 'MainController',
      controllerAs: 'main'
    })
    .state('sign_in', {
      url: '/sign_in',
      templateUrl: 'app/components/userAuth/new.html',
      controller: 'SignInController',
      controllerAs: 'sign_in'
    })
    .state('sign_up', {
      url: '/sign_up',
      templateUrl: 'app/components/userRegistration/new.html',
      controller: 'SignUpController',
      controllerAs: 'sign_up'
    });

  $urlRouterProvider.otherwise('/');
}
