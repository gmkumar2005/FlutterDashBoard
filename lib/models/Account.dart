class Account {
  final String? accountid, name, age, gender, dateofjoining, openiningbalance;

  Account(
      {this.accountid,
      this.name,
      this.age,
      this.gender,
      this.dateofjoining,
      this.openiningbalance});
}

List demoAccounts = [
  Account(
      accountid: "One",
      name: "Ekam",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Account(
      accountid: "Two",
      name: "Dve",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Account(
      accountid: "Three",
      name: "Treeni",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
];
