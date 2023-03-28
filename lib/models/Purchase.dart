// CustomerId. Name. Age. Gender. DateOfPurchase
// Slno. CustomerId. ItemPurchased. Price. Quantity.

class Purchase {
  final String? purchaseid, customerid, itempurchased;
  final double? price;
  final double? quantity;

  Purchase(
      {this.purchaseid,
      this.customerid,
      this.itempurchased,
      this.price,
      this.quantity});
}

List<Purchase> demoPurchases = [
  Purchase(
    purchaseid: "1",
    customerid: "ekam",
    itempurchased: "Laptop",
    price: 100,
    quantity: 1,
  ),
  Purchase(
    purchaseid: "2",
    customerid: "ekam",
    itempurchased: "Mouse",
    price: 200,
    quantity: 2,
  ),
  Purchase(
    purchaseid: "3",
    customerid: "ekam",
    itempurchased: "Memory",
    price: 300,
    quantity: 3,
  ),
];

double? sumofprice =
demoPurchases.map((product) => product.price).reduce((v, e) => v! + e!);
double? sumofQuantity =
demoPurchases.map((product) => product.quantity).reduce((v, e) => v! + e!);
double? totalPurchases = sumofprice! * sumofQuantity!;