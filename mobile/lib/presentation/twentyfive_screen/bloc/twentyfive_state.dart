part of 'twentyfive_bloc.dart';

/// Represents the state of Twentyfive in the application.

// ignore_for_file: must_be_immutable
class TwentyfiveState extends Equatable {
  TwentyfiveState({
    this.usernameInputFieldController,
    this.firstNameInputFieldController,
    this.lastNameInputFieldController,
    this.phoneNumberInputFieldController,
    this.emailInputFieldController,
    this.passwordInputFieldController,
    this.twentyfiveModelObj,
  });

  TextEditingController? usernameInputFieldController;

  TextEditingController? firstNameInputFieldController;
  TextEditingController? lastNameInputFieldController;

  TextEditingController? phoneNumberInputFieldController;

  TextEditingController? emailInputFieldController;

  TextEditingController? passwordInputFieldController;

  TwentyfiveModel? twentyfiveModelObj;

  @override
  List<Object?> get props => [
        usernameInputFieldController,
        lastNameInputFieldController,
        phoneNumberInputFieldController,
        emailInputFieldController,
        passwordInputFieldController,
        twentyfiveModelObj,
        firstNameInputFieldController,
      ];
  TwentyfiveState copyWith({
    TextEditingController? usernameInputFieldController,
    TextEditingController? fullNameInputFieldController,
    TextEditingController? phoneNumberInputFieldController,
    TextEditingController? emailInputFieldController,
    TextEditingController? passwordInputFieldController,
    TwentyfiveModel? twentyfiveModelObj,
    TextEditingController? firstNameInputFieldController,
  }) {
    return TwentyfiveState(
      usernameInputFieldController:
          usernameInputFieldController ?? this.usernameInputFieldController,
      lastNameInputFieldController:
          fullNameInputFieldController ?? this.lastNameInputFieldController,
      phoneNumberInputFieldController: phoneNumberInputFieldController ??
          this.phoneNumberInputFieldController,
      emailInputFieldController:
          emailInputFieldController ?? this.emailInputFieldController,
      passwordInputFieldController:
          passwordInputFieldController ?? this.passwordInputFieldController,
      twentyfiveModelObj: twentyfiveModelObj ?? this.twentyfiveModelObj,
      firstNameInputFieldController:
          firstNameInputFieldController ?? this.firstNameInputFieldController,
    );
  }
}
