import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PassengerEvent extends Equatable {
  const PassengerEvent();
}

class LoadPassengerEvent extends PassengerEvent {
  @override
  List<Object?> get props => [];
}


@immutable
abstract class BookingEvent extends Equatable {
  const BookingEvent();
}

class LoadBookingEvent extends BookingEvent {
  @override
  List<Object?> get props => [];
}


