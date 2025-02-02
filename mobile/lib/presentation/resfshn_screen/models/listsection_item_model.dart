import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listsection_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListsectionItemModel extends Equatable {
  ListsectionItemModel(
      {this.threehundredfor,
      this.tf,
      this.price,
      this.tf1,
      this.twentyfour,
      this.tf2,
      this.tf3,
      this.time,
      this.timeOne,
      this.tf4,
      this.id}) {
    threehundredfor = threehundredfor ?? "lbl_347824686".tr;
    tf = tf ?? "lbl18".tr;
    price = price ?? "lbl_200".tr;
    tf1 = tf1 ?? "lbl28".tr;
    twentyfour = twentyfour ?? "lbl_2_24".tr;
    tf2 = tf2 ?? "lbl29".tr;
    tf3 = tf3 ?? "lbl30".tr;
    time = time ?? "lbl_8_00".tr;
    timeOne = timeOne ?? "lbl_7_00".tr;
    tf4 = tf4 ?? "lbl31".tr;
    id = id ?? "";
  }

  String? threehundredfor;

  String? tf;

  String? price;

  String? tf1;

  String? twentyfour;

  String? tf2;

  String? tf3;

  String? time;

  String? timeOne;

  String? tf4;

  String? id;

  ListsectionItemModel copyWith({
    String? threehundredfor,
    String? tf,
    String? price,
    String? tf1,
    String? twentyfour,
    String? tf2,
    String? tf3,
    String? time,
    String? timeOne,
    String? tf4,
    String? id,
  }) {
    return ListsectionItemModel(
      threehundredfor: threehundredfor ?? this.threehundredfor,
      tf: tf ?? this.tf,
      price: price ?? this.price,
      tf1: tf1 ?? this.tf1,
      twentyfour: twentyfour ?? this.twentyfour,
      tf2: tf2 ?? this.tf2,
      tf3: tf3 ?? this.tf3,
      time: time ?? this.time,
      timeOne: timeOne ?? this.timeOne,
      tf4: tf4 ?? this.tf4,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        threehundredfor,
        tf,
        price,
        tf1,
        twentyfour,
        tf2,
        tf3,
        time,
        timeOne,
        tf4,
        id
      ];
}
