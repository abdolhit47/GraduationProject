part of 'four_bloc.dart';

/// Represents the state of Four in the application.

// ignore_for_file: must_be_immutable
class FourState extends Equatable {
  FourState({
    this.firstNameInputFieldController,
    this.lastNameInputFieldController,
    this.emailInputFieldController,
    this.passwordInputFieldController,
    this.fourModelObj,
  });

  TextEditingController? firstNameInputFieldController;
  TextEditingController? lastNameInputFieldController;

  TextEditingController? emailInputFieldController;

  TextEditingController? passwordInputFieldController;

  FourModel? fourModelObj;

  @override
  List<Object?> get props => [
        firstNameInputFieldController,
        emailInputFieldController,
        passwordInputFieldController,
        fourModelObj,
        lastNameInputFieldController,
      ];
  FourState copyWith({
    TextEditingController? nameInputFieldController,
    TextEditingController? lastNameInputFieldController,
    TextEditingController? emailInputFieldController,
    TextEditingController? passwordInputFieldController,
    FourModel? fourModelObj,
  }) {
    return FourState(
      firstNameInputFieldController:
          nameInputFieldController ?? this.firstNameInputFieldController,
      lastNameInputFieldController:
          lastNameInputFieldController ?? this.lastNameInputFieldController,
      emailInputFieldController:
          emailInputFieldController ?? this.emailInputFieldController,
      passwordInputFieldController:
          passwordInputFieldController ?? this.passwordInputFieldController,
      fourModelObj: fourModelObj ?? this.fourModelObj,
    );
  }
}
