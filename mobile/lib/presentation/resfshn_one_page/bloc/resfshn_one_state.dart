part of 'resfshn_one_bloc.dart';

/// Represents the state of ResfshnOne in the application.

// ignore_for_file: must_be_immutable
class ResfshnOneState extends Equatable {
  ResfshnOneState({this.resfshnOneModelObj});

  ResfshnOneModel? resfshnOneModelObj;

  @override
  List<Object?> get props => [resfshnOneModelObj];
  ResfshnOneState copyWith({ResfshnOneModel? resfshnOneModelObj}) {
    return ResfshnOneState(
      resfshnOneModelObj: resfshnOneModelObj ?? this.resfshnOneModelObj,
    );
  }
}
