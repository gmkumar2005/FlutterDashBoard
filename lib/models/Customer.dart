class Customer {
  final String? accountid, name, age, gender, dateofjoining, openiningbalance;

  Customer(
      {this.accountid,
      this.name,
      this.age,
      this.gender,
      this.dateofjoining,
      this.openiningbalance});
}

List demoCustomers = [
  Customer(
      accountid: "One",
      name: "Ekam",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Customer(
      accountid: "Two",
      name: "Dve",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Customer(
      accountid: "Three",
      name: "Treeni",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
];
