import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/twentyone_model.dart';
import '../models/twentyone_one_item_model.dart';
part 'twentyone_event.dart';
part 'twentyone_state.dart';

/// A bloc that manages the state of a Twentyone according to the event that is dispatched to it.
class TwentyoneBloc extends Bloc<TwentyoneEvent, TwentyoneState> {
  TwentyoneBloc(TwentyoneState initialState) : super(initialState) {
    on<TwentyoneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TwentyoneInitialEvent event,
    Emitter<TwentyoneState> emit,
  ) async {
    emit(
      state.copyWith(
        twentyoneModelObj: state.twentyoneModelObj?.copyWith(
          twentyoneOneItemList: fillTwentyoneOneItemList(),
        ),
      ),
    );
  }

  List<TwentyoneOneItemModel> fillTwentyoneOneItemList() {
    return [
      TwentyoneOneItemModel(
          tf: "lbl54".tr, iconuserOne: ImageConstant.imgIconUser),
      TwentyoneOneItemModel(
          tf: "msg20".tr, iconuserOne: ImageConstant.imgHeroiconsSolidKey),
      TwentyoneOneItemModel(tf: "lbl55".tr, iconuserOne: ImageConstant.imgFile),
      TwentyoneOneItemModel(),
      TwentyoneOneItemModel()
    ];
  }
}
