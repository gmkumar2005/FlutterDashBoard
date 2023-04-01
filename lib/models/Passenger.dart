// Slno. PassengerId. OriginCity. DestinationCity. Distance. ModeOfTransport. PricePerKM
// PassengerId. Name. Age. Gender. DateOfJourney

class Passenger {
  final String? passengerid, name, gender, dateofbirth;
  final int? age;

  Passenger({
    this.passengerid,
    this.name,
    this.gender,
    this.dateofbirth,
    this.age,
  });

  Passenger.fromJson(Map<String, dynamic> json)
      : passengerid = json['passengerid'],
        name = json['name'],
        age = json['age'],
        gender = json['gender'],
        dateofbirth = json['dateofbirth'];

  Map<String, dynamic> toJson() => {
        'passengerid': passengerid,
        'name': name,
        'age': age,
        'gender': gender,
        'dateofbirth': dateofbirth,
      };
}

List<Passenger>  demoPassengers = [
  Passenger(
      passengerid: "One",
      name: "Ekam",
      age: 1,
      gender: "Male",
      dateofbirth: "01-03-2021"),
  Passenger(
      passengerid: "Two",
      name: "Dve",
      age: 2,
      gender: "Male",
      dateofbirth: "02-03-2021"),
  Passenger(
      passengerid: "Three",
      name: "Treeni",
      age: 3,
      gender: "Male",
      dateofbirth: "03-03-2021"),
  Passenger(
      passengerid: "Four",
      name: "Chatvaari",
      age: 4,
      gender: "Male",
      dateofbirth: "04-03-2021")
];
