import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [pricinglist_item_widget] screen.

// ignore_for_file: must_be_immutable
class PricinglistItemModel extends Equatable {
  PricinglistItemModel(
      {this.tf, this.onehundredtwent, this.tf1, this.ten, this.id}) {
    tf = tf ?? "lbl17".tr;
    onehundredtwent = onehundredtwent ?? "lbl_120".tr;
    tf1 = tf1 ?? "lbl18".tr;
    ten = ten ?? "lbl_102".tr;
    id = id ?? "";
  }

  String? tf;

  String? onehundredtwent;

  String? tf1;

  String? ten;

  String? id;

  PricinglistItemModel copyWith({
    String? tf,
    String? onehundredtwent,
    String? tf1,
    String? ten,
    String? id,
  }) {
    return PricinglistItemModel(
      tf: tf ?? this.tf,
      onehundredtwent: onehundredtwent ?? this.onehundredtwent,
      tf1: tf1 ?? this.tf1,
      ten: ten ?? this.ten,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [tf, onehundredtwent, tf1, ten, id];
}
