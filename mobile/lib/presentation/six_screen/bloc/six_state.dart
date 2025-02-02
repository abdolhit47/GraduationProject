part of 'six_bloc.dart';

/// Represents the state of Six in the application.

// ignore_for_file: must_be_immutable
class SixState extends Equatable {
  SixState({this.sixModelObj});

  SixModel? sixModelObj;

  @override
  List<Object?> get props => [sixModelObj];
  SixState copyWith({SixModel? sixModelObj}) {
    return SixState(
      sixModelObj: sixModelObj ?? this.sixModelObj,
    );
  }
}
