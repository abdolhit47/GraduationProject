import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [slider_item_widget] screen.

// ignore_for_file: must_be_immutable
class SliderItemModel extends Equatable {
  SliderItemModel({this.tf, this.forty, this.tf1, this.id}) {
    tf = tf ?? "lbl15".tr;
    forty = forty ?? "lbl_40".tr;
    tf1 = tf1 ?? "msg12".tr;
    id = id ?? "";
  }

  String? tf;

  String? forty;

  String? tf1;

  String? id;

  SliderItemModel copyWith({
    String? tf,
    String? forty,
    String? tf1,
    String? id,
  }) {
    return SliderItemModel(
      tf: tf ?? this.tf,
      forty: forty ?? this.forty,
      tf1: tf1 ?? this.tf1,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [tf, forty, tf1, id];
}
