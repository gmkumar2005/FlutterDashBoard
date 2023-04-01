// CustomerId. Name. Age. Gender. DateOfPurchase
// Slno. CustomerId. ItemPurchased. Price. Quantity.

class Customer {
  final String? customerid, name, gender, dateofregistration;
  final int? age;

  Customer(
      {this.customerid,
      this.name,
      this.age,
      this.gender,
      this.dateofregistration});

  Customer.fromJson(Map<String, dynamic> json)
      : customerid = json['customerid'],
        name = json['name'],
        age = json['age'],
        gender = json['gender'],
        dateofregistration = json['dateofregistration'];

  Map<String, dynamic> toJson() => {
        'customerid': customerid,
        'name': name,
        'age': age,
        'gender': gender,
        'dateofregistration': dateofregistration,
      };
}

List demoCustomers = [
  Customer(
      customerid: "One",
      name: "Ekam",
      age: 1,
      gender: "Male",
      dateofregistration: "01-03-2021"),
  Customer(
      customerid: "Two",
      name: "Dve",
      age: 2,
      gender: "Male",
      dateofregistration: "02-03-2021"),
  Customer(
      customerid: "Three",
      name: "Treeni",
      age: 3,
      gender: "Male",
      dateofregistration: "02-03-2021"),
];
