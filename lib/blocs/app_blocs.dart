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

