part of 'confrmashn_one_bloc.dart';

/// Represents the state of ConfrmashnOne in the application.

// ignore_for_file: must_be_immutable
class ConfrmashnOneState extends Equatable {
  ConfrmashnOneState({this.otpController, this.confrmashnOneModelObj});

  TextEditingController? otpController;

  ConfrmashnOneModel? confrmashnOneModelObj;

  @override
  List<Object?> get props => [otpController, confrmashnOneModelObj];
  ConfrmashnOneState copyWith({
    TextEditingController? otpController,
    ConfrmashnOneModel? confrmashnOneModelObj,
  }) {
    return ConfrmashnOneState(
      otpController: otpController ?? this.otpController,
      confrmashnOneModelObj:
          confrmashnOneModelObj ?? this.confrmashnOneModelObj,
    );
  }
}
