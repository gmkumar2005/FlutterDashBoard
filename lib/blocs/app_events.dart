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


@immutable
abstract class PatientEvent extends Equatable {
  const PatientEvent();
}

class LoadPatientEvent extends PatientEvent {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class TreatmentEvent extends Equatable {
  const TreatmentEvent();
}

class LoadTreatmentEvent extends TreatmentEvent {
  @override
  List<Object?> get props => [];
}
