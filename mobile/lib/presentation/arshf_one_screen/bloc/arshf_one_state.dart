part of 'arshf_one_bloc.dart';

/// Represents the state of ArshfOne in the application.

// ignore_for_file: must_be_immutable
class ArshfOneState extends Equatable {
  ArshfOneState({this.arshfoneTabModelObj, this.arshfOneModelObj});

  ArshfOneModel? arshfOneModelObj;

  ArshfoneTabModel? arshfoneTabModelObj;

  @override
  List<Object?> get props => [arshfoneTabModelObj, arshfOneModelObj];
  ArshfOneState copyWith({
    ArshfoneTabModel? arshfoneTabModelObj,
    ArshfOneModel? arshfOneModelObj,
  }) {
    return ArshfOneState(
      arshfoneTabModelObj: arshfoneTabModelObj ?? this.arshfoneTabModelObj,
      arshfOneModelObj: arshfOneModelObj ?? this.arshfOneModelObj,
    );
  }
}
