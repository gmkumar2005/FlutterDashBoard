class Passenger {
  final String? accountid, name, age, gender, dateofjoining, openiningbalance;

  Passenger(
      {this.accountid,
      this.name,
      this.age,
      this.gender,
      this.dateofjoining,
      this.openiningbalance});
}

List demoPassengers = [
  Passenger(
      accountid: "One",
      name: "Ekam",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Passenger(
      accountid: "Two",
      name: "Dve",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Passenger(
      accountid: "Three",
      name: "Treeni",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
];
