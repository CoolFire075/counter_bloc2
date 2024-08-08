import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<CounterIncrementPressed>(
      (event, emit) {
        emit(
          CounterState(counter: state.counter + 1),
        );
      },
    );
    on<CounterDecrementPressed>(
          (event, emit) {
        emit(
          CounterState(counter: state.counter - 1),
        );
      },
    );
  }
}
