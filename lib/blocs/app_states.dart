import 'package:admin/models/Passenger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/Booking.dart';

@immutable
abstract class PassengerState extends Equatable {}

class PassengerLoadingState extends PassengerState {
  @override
  List<Object?> get props => [];
}

class PassengerLoadedState extends PassengerState {
  final List<Passenger> passengers;
  PassengerLoadedState(this.passengers);
  @override
  List<Object?> get props => [passengers];
}

class PassengerErrorState extends PassengerState {
  final String error;
  PassengerErrorState(this.error);
  @override
  List<Object?> get props => [error];
}



@immutable
abstract class BookingState extends Equatable {}

class BookingLoadingState extends BookingState {
  @override
  List<Object?> get props => [];
}

class BookingLoadedState extends BookingState {
  final List<Booking> bookings;
  BookingLoadedState(this.bookings);
  @override
  List<Object?> get props => [bookings];
}

class BookingErrorState extends BookingState {
  final String error;
  BookingErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

