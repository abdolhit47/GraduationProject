part of 'two_bloc.dart';

/// Represents the state of Two in the application.

// ignore_for_file: must_be_immutable
class TwoState extends Equatable {
  TwoState({this.group157oneController, this.twoModelObj});

  TextEditingController? group157oneController;

  TwoModel? twoModelObj;

  @override
  List<Object?> get props => [group157oneController, twoModelObj];
  TwoState copyWith({
    TextEditingController? group157oneController,
    TwoModel? twoModelObj,
  }) {
    return TwoState(
      group157oneController:
          group157oneController ?? this.group157oneController,
      twoModelObj: twoModelObj ?? this.twoModelObj,
    );
  }
}
