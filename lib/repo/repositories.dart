import 'dart:convert';
import 'package:admin/models/Passenger.dart';
import 'package:http/http.dart';

import '../models/Booking.dart';
class PassengerRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/passengers';

  Future<List<Passenger>> getPassengers() async {
    Response response = await get(Uri.parse(baseUrl+resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Passenger.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}

class BookingsRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/bookings';
  Future<List<Booking>> getBookings() async {
    Response response = await get(Uri.parse(baseUrl+resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Booking.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}