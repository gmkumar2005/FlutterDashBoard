class Payment {
  final String? paymentid, accountid, dateofpayment, purpose;
  final double? amountrecieved, amountpaid;

  Payment(
      {this.paymentid,
      this.accountid,
      this.amountpaid,
      this.amountrecieved,
      this.dateofpayment,
      this.purpose});

  Payment.fromJson(Map<String, dynamic> json)
      : paymentid = json['paymentid'],
        accountid = json['accountid'],
        amountpaid = json['amountpaid'],
        amountrecieved = json['amountrecieved'],
        dateofpayment = json['dateofpayment'],
        purpose = json['purpose'];

  Map<String, dynamic> toJson() => {
        'paymentid': paymentid,
        'accountid': accountid,
        'amountpaid': amountpaid,
        'amountrecieved': amountrecieved,
        'dateofpayment': dateofpayment,
        'purpose': purpose
      };
}

List demoPayments = [
  Payment(
      paymentid: "1",
      accountid: "ekam",
      amountpaid: 100,
      amountrecieved: 0,
      dateofpayment: "01-03-2021",
      purpose: "Loan"),
  Payment(
      paymentid: "2",
      accountid: "ekam",
      amountpaid: 2000,
      amountrecieved: 0,
      dateofpayment: "02-03-2021",
      purpose: "Goods and services"),
  Payment(
      paymentid: "3",
      accountid: "treeni",
      amountpaid: 3000,
      amountrecieved: 0,
      dateofpayment: "03-03-2021",
      purpose: "Goods and services"),
  Payment(
      paymentid: "4",
      accountid: "chatvaari",
      amountpaid: 0,
      amountrecieved: 1231231,
      dateofpayment: "04-03-2021",
      purpose: "Goods and services"),
];

double? sumofamountpaid =
    demoPayments.map((product) => product.amountpaid).reduce((v, e) => v! + e!);
double? sumofAmountRecieved = demoPayments
    .map((product) => product.amountrecieved)
    .reduce((v, e) => v! + e!);
double? totalBalance = sumofAmountRecieved! - sumofamountpaid!;
