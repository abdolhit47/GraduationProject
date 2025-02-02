part of 'resfshn_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ResfshnTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ResfshnTwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ResfshnTwo widget is first created.
class ResfshnTwoInitialEvent extends ResfshnTwoEvent {
  @override
  List<Object?> get props => [];
}
