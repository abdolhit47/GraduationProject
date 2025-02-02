import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/resfshn_two_model.dart';
part 'resfshn_two_event.dart';
part 'resfshn_two_state.dart';

/// A bloc that manages the state of a ResfshnTwo according to the event that is dispatched to it.
class ResfshnTwoBloc extends Bloc<ResfshnTwoEvent, ResfshnTwoState> {
  ResfshnTwoBloc(ResfshnTwoState initialState) : super(initialState) {
    on<ResfshnTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ResfshnTwoInitialEvent event,
    Emitter<ResfshnTwoState> emit,
  ) async {}
}
