part of 'four_bloc.dart';

/// Represents the state of Four in the application.

// ignore_for_file: must_be_immutable
class FourState extends Equatable {
  FourState(
      {this.nameInputFieldController,
      this.emailInputFieldController,
      this.passwordInputFieldController,
      this.fourModelObj});

  TextEditingController? nameInputFieldController;

  TextEditingController? emailInputFieldController;

  TextEditingController? passwordInputFieldController;

  FourModel? fourModelObj;

  @override
  List<Object?> get props => [
        nameInputFieldController,
        emailInputFieldController,
        passwordInputFieldController,
        fourModelObj
      ];
  FourState copyWith({
    TextEditingController? nameInputFieldController,
    TextEditingController? emailInputFieldController,
    TextEditingController? passwordInputFieldController,
    FourModel? fourModelObj,
  }) {
    return FourState(
      nameInputFieldController:
          nameInputFieldController ?? this.nameInputFieldController,
      emailInputFieldController:
          emailInputFieldController ?? this.emailInputFieldController,
      passwordInputFieldController:
          passwordInputFieldController ?? this.passwordInputFieldController,
      fourModelObj: fourModelObj ?? this.fourModelObj,
    );
  }
}
