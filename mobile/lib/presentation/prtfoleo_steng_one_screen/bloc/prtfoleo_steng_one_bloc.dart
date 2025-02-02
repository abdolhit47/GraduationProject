import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/prtfoleo_steng_one_model.dart';
part 'prtfoleo_steng_one_event.dart';
part 'prtfoleo_steng_one_state.dart';

/// A bloc that manages the state of a PrtfoleoStengOne according to the event that is dispatched to it.
class PrtfoleoStengOneBloc
    extends Bloc<PrtfoleoStengOneEvent, PrtfoleoStengOneState> {
  PrtfoleoStengOneBloc(PrtfoleoStengOneState initialState)
      : super(initialState) {
    on<PrtfoleoStengOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PrtfoleoStengOneInitialEvent event,
    Emitter<PrtfoleoStengOneState> emit,
  ) async {
    emit(
      state.copyWith(
        twoController: TextEditingController(),
        oneController: TextEditingController(),
      ),
    );
  }
}
