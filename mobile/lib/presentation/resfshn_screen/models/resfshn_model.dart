import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'listsection_item_model.dart';

/// This class defines the variables used in the [resfshn_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class ResfshnModel extends Equatable {
  ResfshnModel({this.listsectionItemList = const []});

  List<ListsectionItemModel> listsectionItemList;

  ResfshnModel copyWith({List<ListsectionItemModel>? listsectionItemList}) {
    return ResfshnModel(
      listsectionItemList: listsectionItemList ?? this.listsectionItemList,
    );
  }

  @override
  List<Object?> get props => [listsectionItemList];
}
