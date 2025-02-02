import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/nine_initial_model.dart';
import '../models/nine_model.dart';
import '../models/pricinglist_item_model.dart';
import '../models/slider_item_model.dart';
part 'nine_event.dart';
part 'nine_state.dart';

/// A bloc that manages the state of a Nine according to the event that is dispatched to it.
class NineBloc extends Bloc<NineEvent, NineState> {
  NineBloc(NineState initialState) : super(initialState) {
    on<NineInitialEvent>(_onInitialize);
    on<ChangeSliderIndexEvent>(_changeSliderIndex);
  }

  _onInitialize(
    NineInitialEvent event,
    Emitter<NineState> emit,
  ) async {
    emit(
      state.copyWith(
        sliderIndex: 0,
      ),
    );
    emit(
      state.copyWith(
        nineInitialModelObj: state.nineInitialModelObj?.copyWith(
          pricinglistItemList: fillPricinglistItemList(),
          sliderItemList: fillSliderItemList(),
        ),
      ),
    );
  }

  _changeSliderIndex(
    ChangeSliderIndexEvent event,
    Emitter<NineState> emit,
  ) {
    emit(state.copyWith(
      sliderIndex: event.value,
    ));
  }

  List<PricinglistItemModel> fillPricinglistItemList() {
    return [
      PricinglistItemModel(
          tf: "lbl17".tr,
          onehundredtwent: "lbl_120".tr,
          tf1: "lbl18".tr,
          ten: "lbl_102".tr),
      PricinglistItemModel(
          tf: "lbl17".tr,
          onehundredtwent: "lbl_120".tr,
          tf1: "lbl19".tr,
          ten: "lbl_102".tr),
      PricinglistItemModel(
          tf: "lbl17".tr,
          onehundredtwent: "lbl_120".tr,
          tf1: "lbl20".tr,
          ten: "lbl_102".tr),
      PricinglistItemModel(
          tf: "lbl17".tr,
          onehundredtwent: "lbl_120".tr,
          tf1: "lbl_shein".tr,
          ten: "lbl_102".tr)
    ];
  }

  List<SliderItemModel> fillSliderItemList() {
    return [
      SliderItemModel(tf: "lbl15".tr, forty: "lbl_40".tr, tf1: "msg12".tr)
    ];
  }
}
