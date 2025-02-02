import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/confirmationlist_item_model.dart';
import '../models/confrmashn_model.dart';
part 'confrmashn_event.dart';
part 'confrmashn_state.dart';

/// A bloc that manages the state of a Confrmashn according to the event that is dispatched to it.
class ConfrmashnBloc extends Bloc<ConfrmashnEvent, ConfrmashnState> {
  ConfrmashnBloc(ConfrmashnState initialState) : super(initialState) {
    on<ConfrmashnInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ConfrmashnInitialEvent event,
    Emitter<ConfrmashnState> emit,
  ) async {
    emit(
      state.copyWith(
        confrmashnModelObj: state.confrmashnModelObj?.copyWith(
          confirmationlistItemList: fillConfirmationlistItemList(),
        ),
      ),
    );
  }

  List<ConfirmationlistItemModel> fillConfirmationlistItemList() {
    return [
      ConfirmationlistItemModel(
          twentyone: "lbl_2024_2_21".tr, tf: "lbl26".tr, tf1: "msg13".tr),
      ConfirmationlistItemModel(
          twentyone: "lbl_2024_2_21".tr, tf: "lbl26".tr, tf1: "msg13".tr),
      ConfirmationlistItemModel(
          twentyone: "lbl_2024_2_21".tr, tf: "lbl26".tr, tf1: "msg13".tr),
      ConfirmationlistItemModel(
          twentyone: "lbl_2024_2_21".tr, tf: "lbl26".tr, tf1: "msg13".tr)
    ];
  }
}
