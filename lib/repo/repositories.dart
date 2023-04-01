import 'dart:convert';

import 'package:admin/models/Passenger.dart';
import 'package:http/http.dart';

import '../models/Account.dart';
import '../models/Booking.dart';
import '../models/Patient.dart';
import '../models/Payment.dart';
import '../models/Treatment.dart';

class PassengerRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/passengers';

  Future<List<Passenger>> getPassengers() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

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
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Booking.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}

class PatientRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/patients';

  Future<List<Patient>> getPatients() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Patient.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}

class TreatmentRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/treatments';

  Future<List<Treatment>> getTreatments() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Treatment.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}

class AccountRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/accounts';

  Future<List<Account>> getAccounts() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Account.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}

class PaymentsRepository {
  String baseUrl = 'http://127.0.0.1:3001/';
  String resourcePath = '/payments';

  Future<List<Payment>> getPayments() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Payment.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
