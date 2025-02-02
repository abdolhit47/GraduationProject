import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../core/app_export.dart';
import '../models/confrmashn_one_model.dart';
part 'confrmashn_one_event.dart';
part 'confrmashn_one_state.dart';

/// A bloc that manages the state of a ConfrmashnOne according to the event that is dispatched to it.
class ConfrmashnOneBloc extends Bloc<ConfrmashnOneEvent, ConfrmashnOneState>
    with CodeAutoFill {
  ConfrmashnOneBloc(ConfrmashnOneState initialState) : super(initialState) {
    on<ConfrmashnOneInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  _onInitialize(
    ConfrmashnOneInitialEvent event,
    Emitter<ConfrmashnOneState> emit,
  ) async {
    emit(
      state.copyWith(
        otpController: TextEditingController(),
      ),
    );
    listenForCode();
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ConfrmashnOneState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }
}
