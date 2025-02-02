import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/prtfoleo_steng_two_model.dart';
part 'prtfoleo_steng_two_event.dart';
part 'prtfoleo_steng_two_state.dart';

/// A bloc that manages the state of a PrtfoleoStengTwo according to the event that is dispatched to it.
class PrtfoleoStengTwoBloc
    extends Bloc<PrtfoleoStengTwoEvent, PrtfoleoStengTwoState> {
  PrtfoleoStengTwoBloc(PrtfoleoStengTwoState initialState)
      : super(initialState) {
    on<PrtfoleoStengTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PrtfoleoStengTwoInitialEvent event,
    Emitter<PrtfoleoStengTwoState> emit,
  ) async {
    emit(
      state.copyWith(
        oneController: TextEditingController(),
      ),
    );
  }
}
