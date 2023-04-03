import 'dart:convert';

import 'package:admin/models/Passenger.dart';
import 'package:http/http.dart';

import '../models/Account.dart';
import '../models/Booking.dart';
import '../models/Customer.dart';
import '../models/Patient.dart';
import '../models/Payment.dart';
import '../models/Purchase.dart';
import '../models/Treatment.dart';

String baseUrl = 'http://127.0.0.1:3001';

class PassengerRepository {
  String resourcePath = '/passengers';

  Future<List<Passenger>> getPassengers() async {
    try {
      Response response = await get(Uri.parse(baseUrl + resourcePath));

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => Passenger.fromJson(e)).toList();
      } else {
        print(response.reasonPhrase);
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print("Error inside Inside catch $e");
      throw e;
    }
  }
}

class BookingsRepository {
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

class CustomerRepository {
  String resourcePath = '/customers';

  Future<List<Customer>> getCustomers() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Customer.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}

class PurchaseRepository {
  String resourcePath = '/purchases';

  Future<List<Purchase>> getPurchases() async {
    Response response = await get(Uri.parse(baseUrl + resourcePath));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Purchase.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
