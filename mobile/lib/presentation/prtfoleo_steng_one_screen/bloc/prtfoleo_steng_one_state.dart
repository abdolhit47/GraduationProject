part of 'prtfoleo_steng_one_bloc.dart';

/// Represents the state of PrtfoleoStengOne in the application.

// ignore_for_file: must_be_immutable
class PrtfoleoStengOneState extends Equatable {
  PrtfoleoStengOneState(
      {this.twoController, this.oneController, this.prtfoleoStengOneModelObj});

  TextEditingController? twoController;

  TextEditingController? oneController;

  PrtfoleoStengOneModel? prtfoleoStengOneModelObj;

  @override
  List<Object?> get props =>
      [twoController, oneController, prtfoleoStengOneModelObj];
  PrtfoleoStengOneState copyWith({
    TextEditingController? twoController,
    TextEditingController? oneController,
    PrtfoleoStengOneModel? prtfoleoStengOneModelObj,
  }) {
    return PrtfoleoStengOneState(
      twoController: twoController ?? this.twoController,
      oneController: oneController ?? this.oneController,
      prtfoleoStengOneModelObj:
          prtfoleoStengOneModelObj ?? this.prtfoleoStengOneModelObj,
    );
  }
}
