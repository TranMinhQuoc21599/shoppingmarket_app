import 'package:equatable/equatable.dart';

abstract class ExampleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ExampleState {}

class LoadingState extends ExampleState {}

class LoadedState extends ExampleState {
  final List<String> data;

  LoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends ExampleState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
