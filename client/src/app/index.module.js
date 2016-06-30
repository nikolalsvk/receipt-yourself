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

// BusinessPartner components
import { BusinessPartnerDirective } from '../app/components/businessPartner/businessPartner.directive';
import { BusinessPartnerController } from '../app/components/businessPartner/businessPartner.controller';
import { BusinessPartner } from '../app/components/businessPartner/businessPartner.factory';

// ClosingReceipts components
import { ClosingReceiptsDirective } from '../app/components/closingReceipts/closingReceipts.directive';
import { ClosingReceiptsController } from '../app/components/closingReceipts/closingReceipts.controller';
import { ClosingReceipts } from '../app/components/closingReceipts/closingReceipts.factory';

// OutputInvoiceForm components
import { OutputInvoiceFormDirective } from '../app/components/outputInvoiceForm/outputInvoiceForm.directive';
import { OutputInvoiceFormController } from '../app/components/outputInvoiceForm/outputInvoiceForm.controller';

// DailyBankStatement compoments
import { DailyBankStatementController } from '../app/components/dailyBankStatement/dailyBankStatement.controller';
import { DailyBankStatement } from '../app/components/dailyBankStatement/dailyBankStatement.factory';

// DailyStatement compoments
import { DailyStatementDirective } from '../app/components/dailyStatement/dailyStatement.directive';
import { DailyStatementListDirective } from '../app/components/dailyStatement/dailyStatementList.directive';
import { DailyStatementController } from '../app/components/dailyStatement/dailyStatement.controller';
import { DailyStatementListController } from '../app/components/dailyStatement/dailyStatementList.controller';
import { DailyStatement } from '../app/components/dailyStatement/dailyStatement.factory';

// UndoClosures compoments
import { ClosedInputInvoiceController } from '../app/components/undoClosures/closedInputInvoice.controller';
import { ClosedInputInvoiceDirective } from '../app/components/undoClosures/closedInputInvoice.directive';
import { ClosedOutputInvoiceController } from '../app/components/undoClosures/closedOutputInvoice.controller';
import { ClosedOutputInvoiceDirective } from '../app/components/undoClosures/closedOutputInvoice.directive';

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
  .factory('dailyStatement', ['railsResourceFactory', DailyStatement.dailyStatement])
  .factory('dailyBankStatement', ['railsResourceFactory', DailyBankStatement.dailyBankStatement])
  .factory('closingReceipts', ['railsResourceFactory', ClosingReceipts.closingReceipts])
  .service('githubContributor', GithubContributorService)
  .service('webDevTec', WebDevTecService)
  .controller('MainController', MainController)
  .controller('SignInController', SignInController)
  .controller('SignUpController', SignUpController)
  .controller('InputInvoiceController', InputInvoiceController)
  .controller('BusinessPartnerController', BusinessPartnerController)
  .controller('OutputInvoiceController', OutputInvoiceController)
  .controller('ClosingReceiptsController', ClosingReceiptsController)
  .controller('OutputInvoiceFormController', OutputInvoiceFormController)
  .controller('DailyStatementController', DailyStatementController)
  .controller('DailyStatementListController', DailyStatementListController)
  .controller('DailyBankStatementController', DailyBankStatementController)
  .controller('ClosedOutputInvoiceController', ClosedOutputInvoiceController)
  .controller('ClosedInputInvoiceController', ClosedInputInvoiceController)
  .directive('inputInvoice', InputInvoiceDirective)
  .directive('closingReceipts', ClosingReceiptsDirective)
  .directive('dailyStatement', DailyStatementDirective)
  .directive('outputInvoiceForm', OutputInvoiceFormDirective)
  .directive('dailyStatementList', DailyStatementListDirective)
  .directive('outputInvoice', OutputInvoiceDirective)
  .directive('businessPartner', BusinessPartnerDirective)
  .directive('closedOutputInvoice', ClosedOutputInvoiceDirective)
  .directive('closedInputInvoice', ClosedInputInvoiceDirective)
  .directive('acmeMalarkey', MalarkeyDirective);
