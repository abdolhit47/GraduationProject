import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'listsection_item_model.dart';

/// This class is used in the [seventeen_tab_page] screen.

// ignore_for_file: must_be_immutable
class SeventeenTabModel extends Equatable {
  SeventeenTabModel({this.listsectionItemList = const []});

  List<ListsectionItemModel> listsectionItemList;

  SeventeenTabModel copyWith(
      {List<ListsectionItemModel>? listsectionItemList}) {
    return SeventeenTabModel(
      listsectionItemList: listsectionItemList ?? this.listsectionItemList,
    );
  }

  @override
  List<Object?> get props => [listsectionItemList];
}
