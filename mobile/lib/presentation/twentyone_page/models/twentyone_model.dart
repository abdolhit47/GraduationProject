import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'twentyone_one_item_model.dart';

/// This class defines the variables used in the [twentyone_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class TwentyoneModel extends Equatable {
  TwentyoneModel({this.twentyoneOneItemList = const []});

  List<TwentyoneOneItemModel> twentyoneOneItemList;

  TwentyoneModel copyWith({List<TwentyoneOneItemModel>? twentyoneOneItemList}) {
    return TwentyoneModel(
      twentyoneOneItemList: twentyoneOneItemList ?? this.twentyoneOneItemList,
    );
  }

  @override
  List<Object?> get props => [twentyoneOneItemList];
}
