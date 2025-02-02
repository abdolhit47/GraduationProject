import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [twentyone_one_item_widget] screen.

// ignore_for_file: must_be_immutable
class TwentyoneOneItemModel extends Equatable {
  TwentyoneOneItemModel({this.tf, this.iconuserOne, this.id}) {
    tf = tf ?? "lbl54".tr;
    iconuserOne = iconuserOne ?? ImageConstant.imgIconUser;
    id = id ?? "";
  }

  String? tf;

  String? iconuserOne;

  String? id;

  TwentyoneOneItemModel copyWith({
    String? tf,
    String? iconuserOne,
    String? id,
  }) {
    return TwentyoneOneItemModel(
      tf: tf ?? this.tf,
      iconuserOne: iconuserOne ?? this.iconuserOne,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [tf, iconuserOne, id];
}
