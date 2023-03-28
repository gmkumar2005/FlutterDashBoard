// Slno. PassengerId. OriginCity. DestinationCity. Distance. ModeOfTransport. PricePerKM
// PassengerId. Name. Age. Gender. DateOfJourney

class Passenger {
  final String? passengerid, name, age, gender, dateofbirth;

  Passenger(
      {this.passengerid,
      this.name,
      this.age,
      this.gender,
      this.dateofbirth});
}

List demoPassengers = [

  Passenger(
      passengerid: "One",
      name: "Ekam",
      age: "01",
      gender: "Male",
      dateofbirth: "01-03-2021"),

  Passenger(
      passengerid: "Two",
      name: "Dve",
      age: "02",
      gender: "Male",
      dateofbirth: "02-03-2021"),

  Passenger(
      passengerid: "Three",
      name: "Treeni",
      age: "03",
      gender: "Male",
      dateofbirth: "03-03-2021"),

  Passenger(
      passengerid: "Four",
      name: "Chatvaari",
      age: "04",
      gender: "Male",
      dateofbirth: "04-03-2021")

];
