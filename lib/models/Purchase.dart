// CustomerId. Name. Age. Gender. DateOfPurchase
// Slno. CustomerId. ItemPurchased. Price. Quantity.

class Purchase {
  final String? purchaseid, customerid, itempurchased,dateofpurchase;
  final double? price;
  final double? quantity;

  Purchase(
      {this.purchaseid,
      this.customerid,
      this.itempurchased,
      this.price,
      this.quantity,
      this.dateofpurchase});

  Purchase.fromJson(Map<String, dynamic> json)
      : purchaseid = json['purchaseid'],
        customerid = json['customerid'],
        itempurchased = json['itempurchased'],
        price = json['price'],
        quantity = json['quantity'],
  dateofpurchase = json['dateofpurchase'];

  Map<String, dynamic> toJson() => {
        'purchaseid': purchaseid,
        'customerid': customerid,
        'itempurchased': itempurchased,
        'price': price,
        'quantity': quantity,
        'dateofpurchase': dateofpurchase,

      };
}

List<Purchase> demoPurchases = [
  Purchase(
    purchaseid: "1",
    customerid: "ekam",
    itempurchased: "Laptop",
    price: 100,
    quantity: 1,
    dateofpurchase: "01-03-2021",
  ),
  Purchase(
    purchaseid: "2",
    customerid: "ekam",
    itempurchased: "Mouse",
    price: 200,
    quantity: 2,
    dateofpurchase: "01-03-2021",
  ),
  Purchase(
    purchaseid: "3",
    customerid: "ekam",
    itempurchased: "Memory",
    price: 300,
    quantity: 3,
    dateofpurchase: "01-03-2021",
  ),
];

double? sumofprice =
    demoPurchases.map((product) => product.price).reduce((v, e) => v! + e!);
double? sumofQuantity =
    demoPurchases.map((product) => product.quantity).reduce((v, e) => v! + e!);
double? totalPurchases = sumofprice! * sumofQuantity!;
