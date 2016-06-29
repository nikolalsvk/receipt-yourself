export class OutputInvoiceFormController {
  constructor($mdEditDialog, $q, $scope, $mdToast, $state, $timeout, businessPartner, outputInvoice) {
    'ngInject';

    $scope.businessPartners = [];

    let that = this

    businessPartner.query().then(function(results) {
      that.businessPartners = results;
    });

    $scope.test = function() {      // fetch data from business name
     businessPartner.query({ name: $scope.outputInvoice.businessPartner }).then(function (results) {
        $scope.writeToDatabase(results[0].id);    
      }, function (error) {
          // do something about the error
      }); 
    }

    $scope.writeToDatabase = function (businessPartnerId) {
      debugger
        new outputInvoice({
          number: $scope.outputInvoice.number,
          payment_amount: $scope.outputInvoice.paymentAmount,
          remaining_amount: $scope.outputInvoice.remainingAmount,
          business_partner_id: businessPartnerId,
          issuance_date : $scope.outputInvoice.issuanceDate,
          circulation_date: $scope.outputInvoice.circulationDate,
          payment_deadline: $scope.outputInvoice.paymentDeadline
        }).create();
        
        $mdToast.show($mdToast.simple('Successfuly issued output invoice!'));
        $state.go($state.current, {}, {reload: true})
    }
  }
}
