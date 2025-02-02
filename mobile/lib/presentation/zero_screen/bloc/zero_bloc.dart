import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/zero_model.dart';
part 'zero_event.dart';
part 'zero_state.dart';

/// A bloc that manages the state of a Zero according to the event that is dispatched to it.
class ZeroBloc extends Bloc<ZeroEvent, ZeroState> {
  ZeroBloc(ZeroState initialState) : super(initialState) {
    on<ZeroInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ZeroInitialEvent event,
    Emitter<ZeroState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.twoScreen,
      );
    });
  }
}
