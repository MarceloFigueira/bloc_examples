part of 'example_bloc.dart';

class ExampleState {}

class ExampleStateInitial extends ExampleState {
  final String names;

  ExampleStateInitial({required this.names});
}

class ExampleStateData extends ExampleState {
  final List<String> names;

  ExampleStateData({required this.names});
}
