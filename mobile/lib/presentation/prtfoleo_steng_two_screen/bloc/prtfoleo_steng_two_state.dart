part of 'prtfoleo_steng_two_bloc.dart';

/// Represents the state of PrtfoleoStengTwo in the application.

// ignore_for_file: must_be_immutable
class PrtfoleoStengTwoState extends Equatable {
  PrtfoleoStengTwoState({this.oneController, this.prtfoleoStengTwoModelObj});

  TextEditingController? oneController;

  PrtfoleoStengTwoModel? prtfoleoStengTwoModelObj;

  @override
  List<Object?> get props => [oneController, prtfoleoStengTwoModelObj];
  PrtfoleoStengTwoState copyWith({
    TextEditingController? oneController,
    PrtfoleoStengTwoModel? prtfoleoStengTwoModelObj,
  }) {
    return PrtfoleoStengTwoState(
      oneController: oneController ?? this.oneController,
      prtfoleoStengTwoModelObj:
          prtfoleoStengTwoModelObj ?? this.prtfoleoStengTwoModelObj,
    );
  }
}
