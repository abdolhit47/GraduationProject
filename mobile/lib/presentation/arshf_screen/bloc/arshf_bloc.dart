import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/arshf_model.dart';
import '../models/arshf_tab_model.dart';
part 'arshf_event.dart';
part 'arshf_state.dart';

/// A bloc that manages the state of a Arshf according to the event that is dispatched to it.
class ArshfBloc extends Bloc<ArshfEvent, ArshfState> {
  ArshfBloc(ArshfState initialState) : super(initialState) {
    on<ArshfInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ArshfInitialEvent event,
    Emitter<ArshfState> emit,
  ) async {}
}
