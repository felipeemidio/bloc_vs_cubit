import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementEvent {}

class CounterBloc extends Bloc<IncrementEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(increment);
  }

  void increment(IncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
  }
}