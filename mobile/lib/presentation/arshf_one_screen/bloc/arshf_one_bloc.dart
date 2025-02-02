import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/arshf_one_model.dart';
import '../models/arshfone_tab_model.dart';
part 'arshf_one_event.dart';
part 'arshf_one_state.dart';

/// A bloc that manages the state of a ArshfOne according to the event that is dispatched to it.
class ArshfOneBloc extends Bloc<ArshfOneEvent, ArshfOneState> {
  ArshfOneBloc(ArshfOneState initialState) : super(initialState) {
    on<ArshfOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ArshfOneInitialEvent event,
    Emitter<ArshfOneState> emit,
  ) async {}
}
