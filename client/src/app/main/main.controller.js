export class MainController {
  constructor ($rootScope, $state, $timeout, webDevTec, toastr, inputInvoice) {
    'ngInject';

    this.awesomeThings = [];
    this.classAnimation = '';
    this.creationDate = 1462222868758;
    this.toastr = toastr;

    this.inputInvoice = inputInvoice;
    this.getInvoices();
  }

  getInvoices() {
    this.inputInvoices = this.inputInvoice.query().then(function(results) {
    })
  }

  getWebDevTec(webDevTec) {
    this.awesomeThings = webDevTec.getTec();

    angular.forEach(this.awesomeThings, (awesomeThing) => {
      awesomeThing.rank = Math.random();
    });
  }

}
