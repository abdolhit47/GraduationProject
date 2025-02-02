part of 'four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Four widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class FourEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Four widget is first created.
class FourInitialEvent extends FourEvent {
  @override
  List<Object?> get props => [];
}
