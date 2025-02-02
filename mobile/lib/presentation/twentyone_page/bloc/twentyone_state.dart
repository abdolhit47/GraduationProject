part of 'twentyone_bloc.dart';

/// Represents the state of Twentyone in the application.

// ignore_for_file: must_be_immutable
class TwentyoneState extends Equatable {
  TwentyoneState({this.twentyoneModelObj});

  TwentyoneModel? twentyoneModelObj;

  @override
  List<Object?> get props => [twentyoneModelObj];
  TwentyoneState copyWith({TwentyoneModel? twentyoneModelObj}) {
    return TwentyoneState(
      twentyoneModelObj: twentyoneModelObj ?? this.twentyoneModelObj,
    );
  }
}
