part of 'prtfoleo_steng_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PrtfoleoSteng widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class PrtfoleoStengEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the PrtfoleoSteng widget is first created.
class PrtfoleoStengInitialEvent extends PrtfoleoStengEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing date

// ignore_for_file: must_be_immutable
class ChangeDateEvent extends PrtfoleoStengEvent {
  ChangeDateEvent({required this.date});

  DateTime date;

  @override
  List<Object?> get props => [date];
}
