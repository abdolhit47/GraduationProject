import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'pricinglist_item_model.dart';
import 'slider_item_model.dart';

/// This class is used in the [nine_initial_page] screen.

// ignore_for_file: must_be_immutable
class NineInitialModel extends Equatable {
  NineInitialModel(
      {this.sliderItemList = const [], this.pricinglistItemList = const []});

  List<SliderItemModel> sliderItemList;

  List<PricinglistItemModel> pricinglistItemList;

  NineInitialModel copyWith({
    List<SliderItemModel>? sliderItemList,
    List<PricinglistItemModel>? pricinglistItemList,
  }) {
    return NineInitialModel(
      sliderItemList: sliderItemList ?? this.sliderItemList,
      pricinglistItemList: pricinglistItemList ?? this.pricinglistItemList,
    );
  }

  @override
  List<Object?> get props => [sliderItemList, pricinglistItemList];
}
