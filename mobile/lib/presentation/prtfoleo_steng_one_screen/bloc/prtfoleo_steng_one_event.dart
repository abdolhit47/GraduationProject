part of 'prtfoleo_steng_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PrtfoleoStengOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class PrtfoleoStengOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the PrtfoleoStengOne widget is first created.
class PrtfoleoStengOneInitialEvent extends PrtfoleoStengOneEvent {
  @override
  List<Object?> get props => [];
}
