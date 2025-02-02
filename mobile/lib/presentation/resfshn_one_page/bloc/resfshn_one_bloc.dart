import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/resfshn_one_model.dart';
part 'resfshn_one_event.dart';
part 'resfshn_one_state.dart';

/// A bloc that manages the state of a ResfshnOne according to the event that is dispatched to it.
class ResfshnOneBloc extends Bloc<ResfshnOneEvent, ResfshnOneState> {
  ResfshnOneBloc(ResfshnOneState initialState) : super(initialState) {
    on<ResfshnOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ResfshnOneInitialEvent event,
    Emitter<ResfshnOneState> emit,
  ) async {}
}
