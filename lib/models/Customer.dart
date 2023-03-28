// CustomerId. Name. Age. Gender. DateOfPurchase
// Slno. CustomerId. ItemPurchased. Price. Quantity.

class Customer {
  final String? customerid, name, age, gender, dateofregistration;

  Customer(
      {this.customerid,
      this.name,
      this.age,
      this.gender,
      this.dateofregistration});
}

List demoCustomers = [
  Customer(
      customerid: "One",
      name: "Ekam",
      age: "01",
      gender: "Male",
      dateofregistration: "01-03-2021"),
  Customer(
      customerid: "Two",
      name: "Dve",
      age: "02",
      gender: "Male",
      dateofregistration: "02-03-2021"),
  Customer(
      customerid: "Three",
      name: "Treeni",
      age: "03",
      gender: "Male",
      dateofregistration: "02-03-2021"),
];
