part of 'confrmashn_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ConfrmashnOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ConfrmashnOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ConfrmashnOne widget is first created.
class ConfrmashnOneInitialEvent extends ConfrmashnOneEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill

// ignore_for_file: must_be_immutable
class ChangeOTPEvent extends ConfrmashnOneEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [code];
}
