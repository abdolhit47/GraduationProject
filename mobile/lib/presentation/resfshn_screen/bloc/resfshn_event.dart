part of 'resfshn_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Resfshn widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ResfshnEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Resfshn widget is first created.
class ResfshnInitialEvent extends ResfshnEvent {
  @override
  List<Object?> get props => [];
}
