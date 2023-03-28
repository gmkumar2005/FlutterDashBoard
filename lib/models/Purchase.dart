class Purchase {
  final String? txnid, accountid, amountpaid, amountrecieved, dataofpayment;

  Purchase({this.txnid,this.accountid,this.amountpaid,this.amountrecieved,this.dataofpayment});
}

List demoPurchases = [
  Purchase(
    txnid: "1",
    accountid: "ekam",
    amountpaid: "100",
    amountrecieved: "0",
    dataofpayment: "01-03-2021",
  ),
  Purchase(
    txnid: "2",
    accountid: "ekam",
    amountpaid: "200",
    amountrecieved: "0",
    dataofpayment: "02-03-2021",
  ),
];
