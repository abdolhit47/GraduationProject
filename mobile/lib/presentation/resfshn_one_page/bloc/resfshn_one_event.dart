part of 'resfshn_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ResfshnOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ResfshnOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ResfshnOne widget is first created.
class ResfshnOneInitialEvent extends ResfshnOneEvent {
  @override
  List<Object?> get props => [];
}
