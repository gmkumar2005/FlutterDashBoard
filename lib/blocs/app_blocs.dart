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
