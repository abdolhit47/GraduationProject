import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/listsection_item_model.dart';
import '../models/seventeen_model.dart';
import '../models/seventeen_tab_model.dart';
part 'seventeen_event.dart';
part 'seventeen_state.dart';

/// A bloc that manages the state of a Seventeen according to the event that is dispatched to it.
class SeventeenBloc extends Bloc<SeventeenEvent, SeventeenState> {
  SeventeenBloc(SeventeenState initialState) : super(initialState) {
    on<SeventeenInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SeventeenInitialEvent event,
    Emitter<SeventeenState> emit,
  ) async {
    emit(
      state.copyWith(
        seventeenTabModelObj: state.seventeenTabModelObj?.copyWith(
          listsectionItemList: fillListsectionItemList(),
        ),
      ),
    );
  }

  List<ListsectionItemModel> fillListsectionItemList() {
    return [
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr),
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr),
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr),
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr),
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr),
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr),
      ListsectionItemModel(
          price: "lbl_200".tr,
          tf: "lbl43".tr,
          seventyfourmill: "lbl_74875934".tr,
          tf1: "lbl44".tr,
          tf2: "lbl45".tr)
    ];
  }
}
