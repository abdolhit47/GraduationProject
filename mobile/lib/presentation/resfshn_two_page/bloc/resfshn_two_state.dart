part of 'resfshn_two_bloc.dart';

/// Represents the state of ResfshnTwo in the application.

// ignore_for_file: must_be_immutable
class ResfshnTwoState extends Equatable {
  ResfshnTwoState({this.resfshnTwoModelObj});

  ResfshnTwoModel? resfshnTwoModelObj;

  @override
  List<Object?> get props => [resfshnTwoModelObj];
  ResfshnTwoState copyWith({ResfshnTwoModel? resfshnTwoModelObj}) {
    return ResfshnTwoState(
      resfshnTwoModelObj: resfshnTwoModelObj ?? this.resfshnTwoModelObj,
    );
  }
}
