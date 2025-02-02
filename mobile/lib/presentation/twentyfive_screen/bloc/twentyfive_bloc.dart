import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/twentyfive_model.dart';
part 'twentyfive_event.dart';
part 'twentyfive_state.dart';

/// A bloc that manages the state of a Twentyfive according to the event that is dispatched to it.
class TwentyfiveBloc extends Bloc<TwentyfiveEvent, TwentyfiveState> {
  TwentyfiveBloc(TwentyfiveState initialState) : super(initialState) {
    on<TwentyfiveInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TwentyfiveInitialEvent event,
    Emitter<TwentyfiveState> emit,
  ) async {
    emit(
      state.copyWith(
        usernameInputFieldController: TextEditingController(),
        fullNameInputFieldController: TextEditingController(),
        phoneNumberInputFieldController: TextEditingController(),
        emailInputFieldController: TextEditingController(),
        passwordInputFieldController: TextEditingController(),
      ),
    );
  }
}
