part of 'confrmashn_bloc.dart';

/// Represents the state of Confrmashn in the application.

// ignore_for_file: must_be_immutable
class ConfrmashnState extends Equatable {
  ConfrmashnState({this.confrmashnModelObj});

  ConfrmashnModel? confrmashnModelObj;

  @override
  List<Object?> get props => [confrmashnModelObj];
  ConfrmashnState copyWith({ConfrmashnModel? confrmashnModelObj}) {
    return ConfrmashnState(
      confrmashnModelObj: confrmashnModelObj ?? this.confrmashnModelObj,
    );
  }
}
