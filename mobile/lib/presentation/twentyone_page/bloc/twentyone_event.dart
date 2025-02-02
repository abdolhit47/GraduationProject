part of 'twentyone_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Twentyone widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class TwentyoneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Twentyone widget is first created.
class TwentyoneInitialEvent extends TwentyoneEvent {
  @override
  List<Object?> get props => [];
}
