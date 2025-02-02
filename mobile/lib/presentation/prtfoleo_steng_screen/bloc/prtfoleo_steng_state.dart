part of 'prtfoleo_steng_bloc.dart';

/// Represents the state of PrtfoleoSteng in the application.

// ignore_for_file: must_be_immutable
class PrtfoleoStengState extends Equatable {
  PrtfoleoStengState(
      {this.nameInputController,
      this.phoneInputController,
      this.emailInputController,
      this.birthdateInputController,
      this.selectedDropDownValue,
      this.prtfoleoStengModelObj});

  TextEditingController? nameInputController;

  TextEditingController? phoneInputController;

  TextEditingController? emailInputController;

  TextEditingController? birthdateInputController;

  SelectionPopupModel? selectedDropDownValue;

  PrtfoleoStengModel? prtfoleoStengModelObj;

  @override
  List<Object?> get props => [
        nameInputController,
        phoneInputController,
        emailInputController,
        birthdateInputController,
        selectedDropDownValue,
        prtfoleoStengModelObj
      ];
  PrtfoleoStengState copyWith({
    TextEditingController? nameInputController,
    TextEditingController? phoneInputController,
    TextEditingController? emailInputController,
    TextEditingController? birthdateInputController,
    SelectionPopupModel? selectedDropDownValue,
    PrtfoleoStengModel? prtfoleoStengModelObj,
  }) {
    return PrtfoleoStengState(
      nameInputController: nameInputController ?? this.nameInputController,
      phoneInputController: phoneInputController ?? this.phoneInputController,
      emailInputController: emailInputController ?? this.emailInputController,
      birthdateInputController:
          birthdateInputController ?? this.birthdateInputController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      prtfoleoStengModelObj:
          prtfoleoStengModelObj ?? this.prtfoleoStengModelObj,
    );
  }
}
