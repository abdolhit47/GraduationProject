import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [confirmationlist_item_widget] screen.

// ignore_for_file: must_be_immutable
class ConfirmationlistItemModel extends Equatable {
  ConfirmationlistItemModel({this.twentyone, this.tf, this.tf1, this.id}) {
    twentyone = twentyone ?? "lbl_2024_2_21".tr;
    tf = tf ?? "lbl26".tr;
    tf1 = tf1 ?? "msg13".tr;
    id = id ?? "";
  }

  String? twentyone;

  String? tf;

  String? tf1;

  String? id;

  ConfirmationlistItemModel copyWith({
    String? twentyone,
    String? tf,
    String? tf1,
    String? id,
  }) {
    return ConfirmationlistItemModel(
      twentyone: twentyone ?? this.twentyone,
      tf: tf ?? this.tf,
      tf1: tf1 ?? this.tf1,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [twentyone, tf, tf1, id];
}
