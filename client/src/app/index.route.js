export function routerConfig ($stateProvider, $urlRouterProvider, $locationProvider) {
  'ngInject';

  // Enable HTML5 Mode
  $locationProvider
  .html5Mode({
    enabled: true,
    requireBase: false
  })
  .hashPrefix('!');

  $stateProvider
    .state('home', {
      url: '/',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/main/main.html',
          controller: 'MainController'
        },
        frontPageLogin: {
          templateUrl: 'app/components/userAuth/new.html',
          controller: 'SignInController'
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
    })
    .state('invoices', {
      url: '/invoices',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/invoiceTables/invoices.html'
        }
      }
    })
    .state('dailyBankStatements', {
      url: '/daily_bank_statements',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/dailyBankStatement/dailyBankStatement.html',
          controller: 'DailyBankStatementController as dailyBankStCtrl'
        }
      }
    })
    .state('dailyStatements', {
      url: '/daily_bank_statements/:id/',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/dailyStatement/dailyStatements.html'
        }
      }
    })
    .state('undoClosures', {
      url: '/undo_closures',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/undoClosures/undoClosures.html',
          controller: 'DailyBankStatementController as dailyBankStCtrl'
        }
      }
    })
    .state('undoClosuresForBankStatement', {
      url: '/undo_closures/:id/',
      views: {
        navbar: { templateUrl: 'app/components/navbar/navbar.html' },
        content: {
          templateUrl: 'app/components/undoClosures/undoClosuresForBankStatement.html',
        }
      }
    });

  $urlRouterProvider.otherwise('/');
}
