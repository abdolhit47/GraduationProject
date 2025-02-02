part of 'nine_bloc.dart';

/// Represents the state of Nine in the application.

// ignore_for_file: must_be_immutable
class NineState extends Equatable {
  NineState(
      {this.sliderIndex = 0, this.nineInitialModelObj, this.nineModelObj});

  NineModel? nineModelObj;

  int sliderIndex;

  NineInitialModel? nineInitialModelObj;

  @override
  List<Object?> get props => [sliderIndex, nineInitialModelObj, nineModelObj];
  NineState copyWith({
    int? sliderIndex,
    NineInitialModel? nineInitialModelObj,
    NineModel? nineModelObj,
  }) {
    return NineState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      nineInitialModelObj: nineInitialModelObj ?? this.nineInitialModelObj,
      nineModelObj: nineModelObj ?? this.nineModelObj,
    );
  }
}
