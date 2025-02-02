import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/six_model.dart';
part 'six_event.dart';
part 'six_state.dart';

/// A bloc that manages the state of a Six according to the event that is dispatched to it.
class SixBloc extends Bloc<SixEvent, SixState> {
  SixBloc(SixState initialState) : super(initialState) {
    on<SixInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SixInitialEvent event,
    Emitter<SixState> emit,
  ) async {}
}
