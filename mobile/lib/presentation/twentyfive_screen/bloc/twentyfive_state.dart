part of 'twentyfive_bloc.dart';

/// Represents the state of Twentyfive in the application.

// ignore_for_file: must_be_immutable
class TwentyfiveState extends Equatable {
  TwentyfiveState(
      {this.usernameInputFieldController,
      this.fullNameInputFieldController,
      this.phoneNumberInputFieldController,
      this.emailInputFieldController,
      this.passwordInputFieldController,
      this.twentyfiveModelObj});

  TextEditingController? usernameInputFieldController;

  TextEditingController? fullNameInputFieldController;

  TextEditingController? phoneNumberInputFieldController;

  TextEditingController? emailInputFieldController;

  TextEditingController? passwordInputFieldController;

  TwentyfiveModel? twentyfiveModelObj;

  @override
  List<Object?> get props => [
        usernameInputFieldController,
        fullNameInputFieldController,
        phoneNumberInputFieldController,
        emailInputFieldController,
        passwordInputFieldController,
        twentyfiveModelObj
      ];
  TwentyfiveState copyWith({
    TextEditingController? usernameInputFieldController,
    TextEditingController? fullNameInputFieldController,
    TextEditingController? phoneNumberInputFieldController,
    TextEditingController? emailInputFieldController,
    TextEditingController? passwordInputFieldController,
    TwentyfiveModel? twentyfiveModelObj,
  }) {
    return TwentyfiveState(
      usernameInputFieldController:
          usernameInputFieldController ?? this.usernameInputFieldController,
      fullNameInputFieldController:
          fullNameInputFieldController ?? this.fullNameInputFieldController,
      phoneNumberInputFieldController: phoneNumberInputFieldController ??
          this.phoneNumberInputFieldController,
      emailInputFieldController:
          emailInputFieldController ?? this.emailInputFieldController,
      passwordInputFieldController:
          passwordInputFieldController ?? this.passwordInputFieldController,
      twentyfiveModelObj: twentyfiveModelObj ?? this.twentyfiveModelObj,
    );
  }
}
