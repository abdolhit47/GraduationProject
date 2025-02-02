part of 'arshf_bloc.dart';

/// Represents the state of Arshf in the application.

// ignore_for_file: must_be_immutable
class ArshfState extends Equatable {
  ArshfState({this.arshfTabModelObj, this.arshfModelObj});

  ArshfModel? arshfModelObj;

  ArshfTabModel? arshfTabModelObj;

  @override
  List<Object?> get props => [arshfTabModelObj, arshfModelObj];
  ArshfState copyWith({
    ArshfTabModel? arshfTabModelObj,
    ArshfModel? arshfModelObj,
  }) {
    return ArshfState(
      arshfTabModelObj: arshfTabModelObj ?? this.arshfTabModelObj,
      arshfModelObj: arshfModelObj ?? this.arshfModelObj,
    );
  }
}
