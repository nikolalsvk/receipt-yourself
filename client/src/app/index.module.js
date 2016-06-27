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

// InputInvoice components
import { InputInvoiceDirective } from '../app/components/invoiceTables/inputInvoice.directive';
import { InputInvoiceController } from '../app/components/invoiceTables/inputInvoice.controller';
import { InputInvoice } from '../app/components/inputInvoice/inputInvoice.factory';

// OutputInvoice components
import { OutputInvoiceDirective } from '../app/components/invoiceTables/outputInvoice.directive';
import { OutputInvoiceController } from '../app/components/invoiceTables/outputInvoice.controller';
import { OutputInvoice } from '../app/components/outputInvoice/outputInvoice.factory';

import { BusinessPartnerDirective } from '../app/components/businessPartner/businessPartner.directive';
import { BusinessPartnerController } from '../app/components/businessPartner/businessPartner.controller';
import { BusinessPartner } from '../app/components/businessPartner/businessPartner.factory';

angular.module('receiptYourself', ['ngResource',
                                   'ui.router',
                                   'ngMaterial',
                                   'ngMessages',
                                   'toastr',
                                   'md.data.table',
                                   'ng-token-auth',
                                   'rails'])
  .constant('malarkey', malarkey)
  .constant('moment', moment)
  .config(config)
  .config(routerConfig)
  .run(runBlock)
  .factory('inputInvoice', ['railsResourceFactory', InputInvoice.inputInvoice])
  .factory('outputInvoice', ['railsResourceFactory', OutputInvoice.outputInvoice])
  .factory('businessPartner', ['railsResourceFactory', BusinessPartner.businessPartner])
  .service('githubContributor', GithubContributorService)
  .service('webDevTec', WebDevTecService)
  .controller('MainController', MainController)
  .controller('SignInController', SignInController)
  .controller('SignUpController', SignUpController)
  .controller('InputInvoiceController', InputInvoiceController)
  .directive('inputInvoice', InputInvoiceDirective)
  .controller('OutputInvoiceController', OutputInvoiceController)
  .directive('outputInvoice', OutputInvoiceDirective)
  .controller('BusinessPartnerController', BusinessPartnerController)
  .directive('businessPartner', BusinessPartnerDirective)
  .directive('acmeMalarkey', MalarkeyDirective);
