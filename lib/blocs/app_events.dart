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

@immutable
abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class LoadAccountEvent extends AccountEvent {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class LoadPaymentEvent extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class LoadCustomerEvent extends CustomerEvent {
  @override
  List<Object?> get props => [];
}


@immutable
abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();
}

class LoadPurchaseEvent extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}
