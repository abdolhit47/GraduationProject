part of 'resfshn_bloc.dart';

/// Represents the state of Resfshn in the application.

// ignore_for_file: must_be_immutable
class ResfshnState extends Equatable {
  ResfshnState({this.resfshnModelObj});

  ResfshnModel? resfshnModelObj;

  @override
  List<Object?> get props => [resfshnModelObj];
  ResfshnState copyWith({ResfshnModel? resfshnModelObj}) {
    return ResfshnState(
      resfshnModelObj: resfshnModelObj ?? this.resfshnModelObj,
    );
  }
}
