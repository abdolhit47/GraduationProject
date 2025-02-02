part of 'zero_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Zero widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ZeroEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Zero widget is first created.
class ZeroInitialEvent extends ZeroEvent {
  @override
  List<Object?> get props => [];
}
