import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/four_model.dart';
part 'four_event.dart';
part 'four_state.dart';

/// A bloc that manages the state of a Four according to the event that is dispatched to it.
class FourBloc extends Bloc<FourEvent, FourState> {
  FourBloc(FourState initialState) : super(initialState) {
    on<FourInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FourInitialEvent event,
    Emitter<FourState> emit,
  ) async {
    emit(
      state.copyWith(
        nameInputFieldController: TextEditingController(),
        emailInputFieldController: TextEditingController(),
        passwordInputFieldController: TextEditingController(),
      ),
    );
  }
}
