class Booking {
  final String? txnid, accountid, amountpaid, amountrecieved, dataofpayment;

  Booking({this.txnid,this.accountid,this.amountpaid,this.amountrecieved,this.dataofpayment});
}

List demoBookings = [
  Booking(
    txnid: "1",
    accountid: "ekam",
    amountpaid: "100",
    amountrecieved: "0",
    dataofpayment: "01-03-2021",
  ),
  Booking(
    txnid: "2",
    accountid: "ekam",
    amountpaid: "200",
    amountrecieved: "0",
    dataofpayment: "02-03-2021",
  ),
];
