import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/listsection_item_model.dart';
import '../models/resfshn_model.dart';
part 'resfshn_event.dart';
part 'resfshn_state.dart';

/// A bloc that manages the state of a Resfshn according to the event that is dispatched to it.
class ResfshnBloc extends Bloc<ResfshnEvent, ResfshnState> {
  ResfshnBloc(ResfshnState initialState) : super(initialState) {
    on<ResfshnInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ResfshnInitialEvent event,
    Emitter<ResfshnState> emit,
  ) async {
    emit(
      state.copyWith(
        resfshnModelObj: state.resfshnModelObj?.copyWith(
          listsectionItemList: fillListsectionItemList(),
        ),
      ),
    );
  }

  List<ListsectionItemModel> fillListsectionItemList() {
    return [
      ListsectionItemModel(
          threehundredfor: "lbl_347824686".tr,
          tf: "lbl18".tr,
          price: "lbl_200".tr,
          tf1: "lbl28".tr,
          twentyfour: "lbl_2_24".tr,
          tf2: "lbl29".tr,
          tf3: "lbl30".tr,
          time: "lbl_8_00".tr,
          timeOne: "lbl_7_00".tr,
          tf4: "lbl31".tr),
      ListsectionItemModel(
          threehundredfor: "lbl_347824686".tr,
          tf: "lbl18".tr,
          price: "lbl_200".tr,
          tf1: "lbl28".tr,
          twentyfour: "lbl_2_24".tr,
          tf2: "lbl29".tr,
          tf3: "lbl30".tr,
          time: "lbl_8_00".tr,
          timeOne: "lbl_7_00".tr,
          tf4: "lbl31".tr),
      ListsectionItemModel(
          threehundredfor: "lbl_347824686".tr,
          tf: "lbl18".tr,
          price: "lbl_200".tr,
          tf1: "lbl28".tr,
          twentyfour: "lbl_2_24".tr,
          tf2: "lbl29".tr,
          tf3: "lbl30".tr,
          time: "lbl_8_00".tr,
          timeOne: "lbl_7_00".tr,
          tf4: "lbl31".tr)
    ];
  }
}
