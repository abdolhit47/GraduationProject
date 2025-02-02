import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listsection_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListsectionItemModel extends Equatable {
  ListsectionItemModel(
      {this.price,
      this.tf,
      this.seventyfourmill,
      this.tf1,
      this.tf2,
      this.id}) {
    price = price ?? "lbl_200".tr;
    tf = tf ?? "lbl43".tr;
    seventyfourmill = seventyfourmill ?? "lbl_74875934".tr;
    tf1 = tf1 ?? "lbl44".tr;
    tf2 = tf2 ?? "lbl45".tr;
    id = id ?? "";
  }

  String? price;

  String? tf;

  String? seventyfourmill;

  String? tf1;

  String? tf2;

  String? id;

  ListsectionItemModel copyWith({
    String? price,
    String? tf,
    String? seventyfourmill,
    String? tf1,
    String? tf2,
    String? id,
  }) {
    return ListsectionItemModel(
      price: price ?? this.price,
      tf: tf ?? this.tf,
      seventyfourmill: seventyfourmill ?? this.seventyfourmill,
      tf1: tf1 ?? this.tf1,
      tf2: tf2 ?? this.tf2,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [price, tf, seventyfourmill, tf1, tf2, id];
}
