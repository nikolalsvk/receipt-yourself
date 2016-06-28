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

// DailyBankStatementItem components
import { DailyBankStatementItemDirective } from '../app/components/dailyBankStatementItem/dailyBankStatementItem.directive';
import { DailyBankStatementItemController } from '../app/components/dailyBankStatementItem/dailyBankStatementItem.controller';
import { DailyBankStatementItem } from '../app/components/dailyBankStatementItem/dailyBankStatementItem.factory';

// BusinessPartner components
import { BusinessPartnerDirective } from '../app/components/businessPartner/businessPartner.directive';
import { BusinessPartnerController } from '../app/components/businessPartner/businessPartner.controller';
import { BusinessPartner } from '../app/components/businessPartner/businessPartner.factory';

// DailyBankStatement compoments
import { DailyBankStatementController } from '../app/components/dailyBankStatement/dailyBankStatement.controller';
import { DailyBankStatement } from '../app/components/dailyBankStatement/dailyBankStatement.factory';

// DailyStatement compoments
import { DailyStatementDirective } from '../app/components/dailyStatement/dailyStatement.directive';
import { DailyStatementController } from '../app/components/dailyStatement/dailyStatement.controller';
import { DailyStatement } from '../app/components/dailyStatement/dailyStatement.factory';

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
  .factory('dailyBankStatement', ['railsResourceFactory', DailyBankStatement.dailyBankStatement])
  .service('githubContributor', GithubContributorService)
  .service('webDevTec', WebDevTecService)
  .controller('MainController', MainController)
  .controller('SignInController', SignInController)
  .controller('SignUpController', SignUpController)
  .controller('InputInvoiceController', InputInvoiceController)
  .controller('BusinessPartnerController', BusinessPartnerController)
  .controller('OutputInvoiceController', OutputInvoiceController)
  .controller('DailyBankStatementItemController', DailyBankStatementItemController)
  .directive('inputInvoice', InputInvoiceDirective)
  .directive('dailyBankStatementItem', DailyBankStatementItemDirective)
  .directive('outputInvoice', OutputInvoiceDirective)
  .directive('businessPartner', BusinessPartnerDirective)
  .controller('DailyBankStatementController', DailyBankStatementController)
  .directive('acmeMalarkey', MalarkeyDirective);
