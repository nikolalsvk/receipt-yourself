/* global malarkey:false, moment:false */

import { config } from './index.config';
import { routerConfig } from './index.route';
import { runBlock } from './index.run';
import { MainController } from './main/main.controller';
import { SignInController } from '../app/components/userAuth/signIn.controller';
import { SignUpController } from '../app/components/userRegistration/signUp.controller';
import { GithubContributorService } from '../app/components/githubContributor/githubContributor.service';
import { WebDevTecService } from '../app/components/webDevTec/webDevTec.service';
import { MalarkeyDirective } from '../app/components/malarkey/malarkey.directive';

angular.module('receiptYourself', ['ngResource',
                                   'ui.router',
                                   'ngMaterial',
                                   'ngMessages',
                                   'toastr',
                                   'ng-token-auth'])
  .constant('malarkey', malarkey)
  .constant('moment', moment)
  .config(config)
  .config(routerConfig)
  .run(runBlock)
  .service('githubContributor', GithubContributorService)
  .service('webDevTec', WebDevTecService)
  .controller('MainController', MainController)
  .controller('SignInController', SignInController)
  .controller('SignUpController', SignUpController)
  .directive('acmeMalarkey', MalarkeyDirective);
