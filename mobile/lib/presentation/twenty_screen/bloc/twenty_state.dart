part of 'twenty_bloc.dart';

/// Represents the state of Twenty in the application.

// ignore_for_file: must_be_immutable
class TwentyState extends Equatable {
  TwentyState(
      {this.oneController,
      this.chatUser,
      this.messageList,
      this.twentyModelObj});

  TextEditingController? oneController;

  TwentyModel? twentyModelObj;

  types.User? chatUser;

  List<types.Message>? messageList;

  @override
  List<Object?> get props =>
      [oneController, chatUser, messageList, twentyModelObj];
  TwentyState copyWith({
    TextEditingController? oneController,
    types.User? chatUser,
    List<types.Message>? messageList,
    TwentyModel? twentyModelObj,
  }) {
    return TwentyState(
      oneController: oneController ?? this.oneController,
      chatUser: chatUser ?? this.chatUser,
      messageList: messageList ?? this.messageList,
      twentyModelObj: twentyModelObj ?? this.twentyModelObj,
    );
  }
}
