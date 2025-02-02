import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'confirmationlist_item_model.dart';

/// This class defines the variables used in the [confrmashn_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class ConfrmashnModel extends Equatable {
  ConfrmashnModel({this.confirmationlistItemList = const []});

  List<ConfirmationlistItemModel> confirmationlistItemList;

  ConfrmashnModel copyWith(
      {List<ConfirmationlistItemModel>? confirmationlistItemList}) {
    return ConfrmashnModel(
      confirmationlistItemList:
          confirmationlistItemList ?? this.confirmationlistItemList,
    );
  }

  @override
  List<Object?> get props => [confirmationlistItemList];
}
