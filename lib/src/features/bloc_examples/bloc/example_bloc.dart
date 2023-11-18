import 'dart:async';

import 'package:bloc/bloc.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
  }

  FutureOr<void> _findNames(
    ExampleFindNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    final names = [
      'marcelo',
      'tatiane',
      'gabriele',
    ];
    await Future.delayed(Duration(seconds: 4));
    emit(ExampleStateData(names: names));
  }
}
