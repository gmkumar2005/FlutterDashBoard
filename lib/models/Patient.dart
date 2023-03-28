class Patient {
  final String? accountid, name, age, gender, dateofjoining, openiningbalance;

  Patient(
      {this.accountid,
      this.name,
      this.age,
      this.gender,
      this.dateofjoining,
      this.openiningbalance});
}

List demoPatients = [
  Patient(
      accountid: "One",
      name: "Ekam",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Patient(
      accountid: "Two",
      name: "Dve",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
  Patient(
      accountid: "Three",
      name: "Treeni",
      age: "01-03-2021",
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: "12313"),
];
