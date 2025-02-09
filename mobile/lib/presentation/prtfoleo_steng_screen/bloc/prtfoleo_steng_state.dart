part of 'prtfoleo_steng_bloc.dart';

/// Represents the state of PrtfoleoSteng in the application.

// ignore_for_file: must_be_immutable
class PrtfoleoStengState extends Equatable {
  PrtfoleoStengState({
    this.firstNameInputController,
    this.lastNameInputController,
    this.userNameInputController,
    this.phoneInputController,
    this.emailInputController,
    this.birthdateInputController,
    this.selectedDropDownValue,
    this.prtfoleoStengModelObj,
  });

  TextEditingController? firstNameInputController;
  TextEditingController? lastNameInputController;
  TextEditingController? userNameInputController;

  TextEditingController? phoneInputController;

  TextEditingController? emailInputController;

  TextEditingController? birthdateInputController;

  SelectionPopupModel? selectedDropDownValue;

  PrtfoleoStengModel? prtfoleoStengModelObj;

  @override
  List<Object?> get props => [
        firstNameInputController,
        lastNameInputController,
        userNameInputController,
        phoneInputController,
        emailInputController,
        birthdateInputController,
        selectedDropDownValue,
        prtfoleoStengModelObj
      ];
  PrtfoleoStengState copyWith({
    TextEditingController? firstNameInputController,
    TextEditingController? lastNameInputController,
    TextEditingController? userNameInputController,
    TextEditingController? phoneInputController,
    TextEditingController? emailInputController,
    TextEditingController? birthdateInputController,
    SelectionPopupModel? selectedDropDownValue,
    PrtfoleoStengModel? prtfoleoStengModelObj,
  }) {
    return PrtfoleoStengState(
      firstNameInputController:
          firstNameInputController ?? this.firstNameInputController,
      lastNameInputController:
          lastNameInputController ?? this.lastNameInputController,
      userNameInputController:
          userNameInputController ?? this.userNameInputController,
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
