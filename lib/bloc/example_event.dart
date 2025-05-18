import 'package:equatable/equatable.dart';

abstract class ExampleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDataEvent extends ExampleEvent {}

class RefreshDataEvent extends ExampleEvent {}
