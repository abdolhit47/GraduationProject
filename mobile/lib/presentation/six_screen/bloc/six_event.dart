part of 'six_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Six widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class SixEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Six widget is first created.
class SixInitialEvent extends SixEvent {
  @override
  List<Object?> get props => [];
}
