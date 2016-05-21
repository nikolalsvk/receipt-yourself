export function routerConfig ($stateProvider, $urlRouterProvider) {
  'ngInject';
  $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'app/main/main.html',
      controller: 'MainController',
      controllerAs: 'main'
    })
    .state('signIn', {
      url: '/sign_in',
      templateUrl: 'app/components/userAuth/new.html',
      controller: 'SignInController',
      controllerAs: 'sign_in'
    });

  $urlRouterProvider.otherwise('/');
}
