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
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/main/main.html',
          controller: 'MainController'
        }
      }
    })
    .state('sign_in', {
      url: '/sign_in',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/userAuth/new.html',
          controller: 'SignInController'
        }
      }
    })
    .state('sign_up', {
      url: '/sign_up',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/userRegistration/new.html',
          controller: 'SignUpController'
        }
      }
    });

  $urlRouterProvider.otherwise('/');
}
