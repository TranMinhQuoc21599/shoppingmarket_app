import 'package:flutter_bloc/flutter_bloc.dart';
import 'example_event.dart';
import 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(InitialState()) {
    on<LoadDataEvent>(_onLoadData);
    on<RefreshDataEvent>(_onRefreshData);
  }

  void _onLoadData(LoadDataEvent event, Emitter<ExampleState> emit) async {
    emit(LoadingState());
    try {
      // Simulate data fetching
      await Future.delayed(Duration(seconds: 2));
      emit(LoadedState(['Item 1', 'Item 2', 'Item 3']));
    } catch (e) {
      emit(ErrorState('Failed to load data'));
    }
  }

  void _onRefreshData(
    RefreshDataEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(LoadingState());
    try {
      // Simulate data refreshing
      await Future.delayed(Duration(seconds: 1));
      emit(LoadedState(['Item A', 'Item B', 'Item C']));
    } catch (e) {
      emit(ErrorState('Failed to refresh data'));
    }
  }
}
