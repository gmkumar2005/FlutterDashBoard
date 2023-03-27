class Payment {
  final String? txnid, accountid, amountpaid, amountrecieved, dataofpayment;

  Payment({this.txnid,this.accountid,this.amountpaid,this.amountrecieved,this.dataofpayment});
}

List demoPayments = [
  Payment(
    txnid: "1",
    accountid: "ekam",
    amountpaid: "100",
    amountrecieved: "0",
    dataofpayment: "01-03-2021",
  ),
  Payment(
    txnid: "2",
    accountid: "ekam",
    amountpaid: "200",
    amountrecieved: "0",
    dataofpayment: "02-03-2021",
  ),
];
