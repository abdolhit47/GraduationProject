import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [twentyone_one_item_widget] screen.

// ignore_for_file: must_be_immutable
class TwentyoneOneItemModel extends Equatable {
  TwentyoneOneItemModel({this.tf, this.iconuserOne, this.id, this.onTap}) {
    tf = tf ?? "lbl54".tr;
    iconuserOne = iconuserOne ?? ImageConstant.imgIconUser;
    id = id ?? "";
    this.onTap = onTap;
  }

  String? tf;

  String? iconuserOne;

  String? id;

  Function()? onTap;

  TwentyoneOneItemModel copyWith({
    String? tf,
    String? iconuserOne,
    String? id,
    Function()? onTap,
  }) {
    return TwentyoneOneItemModel(
      tf: tf ?? this.tf,
      iconuserOne: iconuserOne ?? this.iconuserOne,
      id: id ?? this.id,
      onTap: onTap ?? this.onTap,
    );
  }

  @override
  List<Object?> get props => [tf, iconuserOne, id, onTap];
}
