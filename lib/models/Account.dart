class Account {
  final String? accountid, name, gender, dateofjoining;
  final int? age;
  final double? openiningbalance;

  Account(
      {this.accountid,
      this.name,
      this.age,
      this.gender,
      this.dateofjoining,
      this.openiningbalance});

  Account.fromJson(Map<String, dynamic> json)
      : accountid = json['accountid'],
        name = json['name'],
        age = json['age'],
        gender = json['gender'],
        dateofjoining = json['dateofjoining'],
        openiningbalance = json['openiningbalance'];

  Map<String, dynamic> toJson() => {
        'accountid': accountid,
        'name': name,
        'age': age,
        'gender': gender,
        'dateofjoining': dateofjoining,
        'openiningbalance': openiningbalance,
      };
}

List demoAccounts = [
  Account(
      accountid: "One",
      name: "Ekam",
      age: 21,
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: 12313),
  Account(
      accountid: "Two",
      name: "Dve",
      age: 22,
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: 12313),
  Account(
      accountid: "Three",
      name: "Treeni",
      age: 23,
      gender: "Male",
      dateofjoining: "01-03-2021",
      openiningbalance: 12313),
];
