import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/two_model.dart';
part 'two_event.dart';
part 'two_state.dart';

/// A bloc that manages the state of a Two according to the event that is dispatched to it.
class TwoBloc extends Bloc<TwoEvent, TwoState> {
  TwoBloc(TwoState initialState) : super(initialState) {
    on<TwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TwoInitialEvent event,
    Emitter<TwoState> emit,
  ) async {
    emit(
      state.copyWith(
        group157oneController: TextEditingController(),
      ),
    );
  }
}
