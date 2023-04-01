import 'package:admin/blocs/app_events.dart';
import 'package:admin/blocs/app_states.dart';
import 'package:admin/repo/repositories.dart';
import 'package:bloc/bloc.dart';

class PassengerBloc extends Bloc<PassengerEvent, PassengerState> {
  final PassengerRepository _passengerRepository;

  PassengerBloc(this._passengerRepository) : super(PassengerLoadingState()) {
    on<LoadPassengerEvent>((event, emit) async {
      emit(PassengerLoadingState());
      try {
        final passengers = await _passengerRepository.getPassengers();
        emit(PassengerLoadedState(passengers));
      } catch (e) {
        print(e);
        emit(PassengerErrorState(e.toString()));
      }
    });
  }
}

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingsRepository _bookingRepository;

  BookingBloc(this._bookingRepository) : super(BookingLoadingState()) {
    on<LoadBookingEvent>((event, emit) async {
      emit(BookingLoadingState());
      try {
        final bookings = await _bookingRepository.getBookings();
        emit(BookingLoadedState(bookings));
      } catch (e) {
        print(e);
        emit(BookingErrorState(e.toString()));
      }
    });
  }
}

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientRepository _patientRepository;

  PatientBloc(this._patientRepository) : super(PatientLoadingState()) {
    on<LoadPatientEvent>((event, emit) async {
      emit(PatientLoadingState());
      try {
        final patients = await _patientRepository.getPatients();
        emit(PatientLoadedState(patients));
      } catch (e) {
        print(e);
        emit(PatientErrorState(e.toString()));
      }
    });
  }
}

class TreatmentBloc extends Bloc<TreatmentEvent, TreatmentState> {
  final TreatmentRepository _treatmentRepository;

  TreatmentBloc(this._treatmentRepository) : super(TreatmentLoadingState()) {
    on<LoadTreatmentEvent>((event, emit) async {
      emit(TreatmentLoadingState());
      try {
        final treatments = await _treatmentRepository.getTreatments();
        emit(TreatmentLoadedState(treatments));
      } catch (e) {
        print(e);
        emit(TreatmentErrorState(e.toString()));
      }
    });
  }
}

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _accountRepository;

  AccountBloc(this._accountRepository) : super(AccountLoadingState()) {
    on<LoadAccountEvent>((event, emit) async {
      emit(AccountLoadingState());
      try {
        final accounts = await _accountRepository.getAccounts();
        emit(AccountLoadedState(accounts));
      } catch (e) {
        print(e);
        emit(AccountErrorState(e.toString()));
      }
    });
  }
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentsRepository _paymentRepository;

  PaymentBloc(this._paymentRepository) : super(PaymentLoadingState()) {
    on<LoadPaymentEvent>((event, emit) async {
      emit(PaymentLoadingState());
      try {
        final payments = await _paymentRepository.getPayments();
        emit(PaymentLoadedState(payments));
      } catch (e) {
        print(e);
        emit(PaymentErrorState(e.toString()));
      }
    });
  }
}

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository _customerRepository;

  CustomerBloc(this._customerRepository) : super(CustomerLoadingState()) {
    on<LoadCustomerEvent>((event, emit) async {
      emit(CustomerLoadingState());
      try {
        final customers = await _customerRepository.getCustomers();
        emit(CustomerLoadedState(customers));
      } catch (e) {
        print(e);
        emit(CustomerErrorState(e.toString()));
      }
    });
  }
}

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final PurchaseRepository _purchaseRepository;

  PurchaseBloc(this._purchaseRepository) : super(PurchaseLoadingState()) {
    on<LoadPurchaseEvent>((event, emit) async {
      emit(PurchaseLoadingState());
      try {
        final purchases = await _purchaseRepository.getPurchases();
        emit(PurchaseLoadedState(purchases));
      } catch (e) {
        print(e);
        emit(PurchaseErrorState(e.toString()));
      }
    });
  }
}
