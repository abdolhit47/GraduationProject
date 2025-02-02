import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [prtfoleo_steng_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class PrtfoleoStengModel extends Equatable {
  PrtfoleoStengModel(
      {this.selectedBirthdateInput,
      this.birthdateInput = "\"\"",
      this.dropdownItemList = const []}) {
    selectedBirthdateInput = selectedBirthdateInput ?? DateTime.now();
  }

  DateTime? selectedBirthdateInput;

  String birthdateInput;

  List<SelectionPopupModel> dropdownItemList;

  PrtfoleoStengModel copyWith({
    DateTime? selectedBirthdateInput,
    String? birthdateInput,
    List<SelectionPopupModel>? dropdownItemList,
  }) {
    return PrtfoleoStengModel(
      selectedBirthdateInput:
          selectedBirthdateInput ?? this.selectedBirthdateInput,
      birthdateInput: birthdateInput ?? this.birthdateInput,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props =>
      [selectedBirthdateInput, birthdateInput, dropdownItemList];
}
