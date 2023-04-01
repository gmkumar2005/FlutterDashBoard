// Slno. PassengerId. OriginCity. DestinationCity. Distance. ModeOfTransport. PricePerKM
// PassengerId. Name. Age. Gender. DateOfJourney

class Booking {
  final String? bookingid,
      passengerid,
      origincity,
      destinationcity,
      dateofjourney;
  final double? price, distance;

  Booking(
      {this.bookingid,
      this.passengerid,
      this.origincity,
      this.destinationcity,
      this.distance,
      this.price,
      this.dateofjourney});

  Booking.fromJson(Map<String, dynamic> json)
      : bookingid = json['bookingid'],
        passengerid = json['passengerid'],
        origincity = json['origincity'],
        destinationcity = json['destinationcity'],
        distance = json['distance'],
        price = json['price'],
        dateofjourney = json['dateofjourney'];

  Map<String, dynamic> toJson() => {
        'bookingid': bookingid,
        'passengerid': passengerid,
        'origincity': origincity,
        'destinationcity': destinationcity,
        'distance': distance,
        'price': price,
        'dateofjourney': dateofjourney,
      };
}

List<Booking> demoBookings = [
  Booking(
      bookingid: "1",
      passengerid: "ekam",
      origincity: "mumbai",
      destinationcity: "pune",
      distance: 100,
      price: 1000,
      dateofjourney: "01-03-2021"),
  Booking(
      bookingid: "2",
      passengerid: "dve",
      origincity: "mumbai",
      destinationcity: "pune",
      distance: 200,
      price: 2000,
      dateofjourney: "02-03-2021"),
  Booking(
      bookingid: "3",
      passengerid: "treeni",
      origincity: "mumbai",
      destinationcity: "pune",
      distance: 300,
      price: 3000,
      dateofjourney: "03-03-2021"),
  Booking(
      bookingid: "4",
      passengerid: "chatvaari",
      origincity: "mumbai",
      destinationcity: "pune",
      distance: 500,
      price: 5000,
      dateofjourney: "05-03-2021"),
];

double? sumofprice =
    demoBookings.map((product) => product.price).reduce((v, e) => v! + e!);
double? sumofDistance =
    demoBookings.map((product) => product.distance).reduce((v, e) => v! + e!);
double? totalBookings = sumofprice! * sumofDistance!;
