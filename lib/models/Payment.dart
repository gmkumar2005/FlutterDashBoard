class Payment {
  final String? txnid,
      accountid,
      dataofpayment,
      purpose;
final double? amountrecieved,amountpaid;
  Payment(
      {this.txnid,
      this.accountid,
      this.amountpaid,
      this.amountrecieved,
      this.dataofpayment,
      this.purpose});
}

List demoPayments = [
  Payment(
      txnid: "1",
      accountid: "ekam",
      amountpaid: 100,
      amountrecieved: 0,
      dataofpayment: "01-03-2021",
      purpose: "Loan"),
  Payment(
      txnid: "2",
      accountid: "ekam",
      amountpaid: 2000,
      amountrecieved: 0,
      dataofpayment: "02-03-2021",
      purpose: "Goods and services"),
  Payment(
      txnid: "3",
      accountid: "treeni",
      amountpaid: 3000,
      amountrecieved: 0,
      dataofpayment: "03-03-2021",
      purpose: "Goods and services"),
  Payment(
      txnid: "4",
      accountid: "chatvaari",
      amountpaid: 0,
      amountrecieved: 1231231,
      dataofpayment: "04-03-2021",
      purpose: "Goods and services"),

];

double? sumofamountpaid =
demoPayments.map((product) => product.amountpaid).reduce((v, e) => v! + e!);
double? sumofAmountRecieved =
demoPayments.map((product) => product.amountrecieved).reduce((v, e) => v! + e!);
double? totalBalance = sumofAmountRecieved! - sumofamountpaid!;
